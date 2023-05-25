# =============================================================================
# Part of Makefile from https://github.com/tomctomc/coco_roms
# =============================================================================

LWASM=lwasm --6809 --format=raw --list-nofiles --pragma=noindex0tonone --includedir=../defines

all: verify

clean:
	rm -f *.lst auto_* *.rom a.out

auto_symbols_coco.asm: rs_const.asm rs_mem.asm rs_roms.asm rs_skip_ops.asm rs_io_area.asm
	${LWASM} --symbol-dump=$@ rs_const.asm rs_mem.asm rs_roms.asm rs_skip_ops.asm rs_io_area.asm

auto_symbols_bas.asm: bas20.rom

auto_symbols_extbas.asm: extbas20.rom

bas20.rom: ../defines/coco3-defs.asm auto_symbols_coco.asm bas.asm
	${LWASM} -o$@ -l >${@:.rom=.lst} ../defines/coco3-defs.asm auto_symbols_coco.asm bas.asm -DVERBAS=20 --symbol-dump=auto_symbols_bas.asm

extbas20.rom: ../defines/coco3-defs.asm auto_symbols_bas.asm extbas.asm
	${LWASM} -o$@ -l >${@:.rom=.lst} ../defines/coco3-defs.asm auto_symbols_bas.asm extbas.asm -DVEREXTBAS=20 --symbol-dump=auto_symbols_extbas.asm

disk11.rom: ../defines/coco3-defs.asm auto_symbols_extbas.asm extbas.asm
	${LWASM} -o$@ -l >${@:.rom=.lst} ../defines/coco3-defs.asm auto_symbols_extbas.asm disk.asm -DVERDISK=11

supbas20.rom: ../defines/coco3-defs.asm auto_symbols_extbas.asm supbas.asm
	${LWASM} -o$@ -l >${@:.rom=.lst} ../defines/coco3-defs.asm auto_symbols_extbas.asm supbas.asm -DCOCOPAL=0

#
# coco3.rom is just a single 32k concatentation of:
#
#     extbas20 8000-9FFF  (8k)
#        bas20 A000-BFFF  (8k)
#     supbas20 C000-FFFF (16k)
#
coco3.rom: bas20.rom extbas20.rom supbas20.rom
	cat extbas20.rom bas20.rom supbas20.rom >$@

#
# compare our assembled rom binaries with known SHA1 hashes from
# http://www.mess.org (mess -listxml output)
#
verify: disk11.rom coco3.rom
	@echo "verifying all roms..."
	@# ============== "official" mess hashes (taken directly from `mess -listxml`)
	@sha1sum disk11.rom      | grep "10bdc5aa2d7d7f205f67b47b19003a4bd89defd1" >/dev/null && echo "disk11.rom:    OK" || echo "disk11.rom:    ***** BAD SHA1 *****"
	@sha1sum coco3.rom       | grep "e0d82953fb6fd03768604933df1ce8bc51fc427d" >/dev/null && echo "coco3.rom      OK" || echo "coco3.rom      ***** BAD SHA1 *****"
	@# ============== self-generated hashes (these files are actually just portions of coco3.rom and coco3p.rom above)
	@sha1sum bas20.rom       | grep "09015df53738be4ae9e50a84f26a19b8582c05ff" >/dev/null && echo "bas20.rom      OK" || echo "bas20.rom      ***** BAD SHA1 *****"
	@sha1sum extbas20.rom    | grep "d322cbd9f959bdc5f2cba7baac37071450946b5e" >/dev/null && echo "extbas20.rom:  OK" || echo "extbas20.rom:  ***** BAD SHA1 *****"
	@sha1sum supbas20.rom    | grep "9a05652fd80ab87219102800fe6a44a4ecacd8c3" >/dev/null && echo "supbas20.rom:  OK" || echo "supbas20.rom:  ***** BAD SHA1 *****"
