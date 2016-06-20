LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_CFLAGS    := -Wall -include autoconf.h
LOCAL_MODULE    := busybox

BUSYBOX_PATH := ../busybox
BUSYBOX_SRCS := \
	$(BUSYBOX_PATH)/applets/applets.c \
	$(BUSYBOX_PATH)/archival/dpkg.c \
	$(BUSYBOX_PATH)/archival/unzip.c \
	$(BUSYBOX_PATH)/archival/rpm2cpio.c \
	$(BUSYBOX_PATH)/archival/rpm.c \
	$(BUSYBOX_PATH)/archival/gzip.c \
	$(BUSYBOX_PATH)/archival/bbunzip.c \
	$(BUSYBOX_PATH)/archival/lzop.c \
	$(BUSYBOX_PATH)/archival/cpio.c \
	$(BUSYBOX_PATH)/archival/bzip2.c \
	$(BUSYBOX_PATH)/archival/ar.c \
	$(BUSYBOX_PATH)/archival/dpkg_deb.c \
	$(BUSYBOX_PATH)/archival/libarchive/header_skip.c \
	$(BUSYBOX_PATH)/archival/libarchive/unsafe_prefix.c \
	$(BUSYBOX_PATH)/archival/libarchive/filter_accept_list_reassign.c \
	$(BUSYBOX_PATH)/archival/libarchive/filter_accept_reject_list.c \
	$(BUSYBOX_PATH)/archival/libarchive/find_list_entry.c \
	$(BUSYBOX_PATH)/archival/libarchive/decompress_unxz.c \
	$(BUSYBOX_PATH)/archival/libarchive/decompress_uncompress.c \
	$(BUSYBOX_PATH)/archival/libarchive/init_handle.c \
	$(BUSYBOX_PATH)/archival/libarchive/seek_by_jump.c \
	$(BUSYBOX_PATH)/archival/libarchive/header_list.c \
	$(BUSYBOX_PATH)/archival/libarchive/data_extract_all.c \
	$(BUSYBOX_PATH)/archival/libarchive/header_verbose_list.c \
	$(BUSYBOX_PATH)/archival/libarchive/get_header_ar.c \
	$(BUSYBOX_PATH)/archival/libarchive/lzo1x_9x.c \
	$(BUSYBOX_PATH)/archival/libarchive/data_skip.c \
	$(BUSYBOX_PATH)/archival/libarchive/data_extract_to_stdout.c \
	$(BUSYBOX_PATH)/archival/libarchive/get_header_tar_gz.c \
	$(BUSYBOX_PATH)/archival/libarchive/lzo1x_1o.c \
	$(BUSYBOX_PATH)/archival/libarchive/seek_by_read.c \
	$(BUSYBOX_PATH)/archival/libarchive/unpack_ar_archive.c \
	$(BUSYBOX_PATH)/archival/libarchive/filter_accept_list.c \
	$(BUSYBOX_PATH)/archival/libarchive/lzo1x_d.c \
	$(BUSYBOX_PATH)/archival/libarchive/get_header_tar.c \
	$(BUSYBOX_PATH)/archival/libarchive/lzo1x_1.c \
	$(BUSYBOX_PATH)/archival/libarchive/data_align.c \
	$(BUSYBOX_PATH)/archival/libarchive/decompress_unlzma.c \
	$(BUSYBOX_PATH)/archival/libarchive/filter_accept_all.c \
	$(BUSYBOX_PATH)/archival/libarchive/get_header_tar_lzma.c \
	$(BUSYBOX_PATH)/archival/libarchive/open_transformer.c \
	$(BUSYBOX_PATH)/archival/libarchive/decompress_bunzip2.c \
	$(BUSYBOX_PATH)/archival/libarchive/decompress_gunzip.c \
	$(BUSYBOX_PATH)/archival/libarchive/get_header_tar_xz.c \
	$(BUSYBOX_PATH)/archival/libarchive/get_header_cpio.c \
	$(BUSYBOX_PATH)/archival/libarchive/get_header_tar_bz2.c \
	$(BUSYBOX_PATH)/archival/tar.c \
	$(BUSYBOX_PATH)/console-tools/openvt.c \
	$(BUSYBOX_PATH)/console-tools/loadkmap.c \
	$(BUSYBOX_PATH)/console-tools/setlogcons.c \
	$(BUSYBOX_PATH)/console-tools/resize.c \
	$(BUSYBOX_PATH)/console-tools/fgconsole.c \
	$(BUSYBOX_PATH)/console-tools/deallocvt.c \
	$(BUSYBOX_PATH)/console-tools/chvt.c \
	$(BUSYBOX_PATH)/console-tools/reset.c \
	$(BUSYBOX_PATH)/console-tools/dumpkmap.c \
	$(BUSYBOX_PATH)/console-tools/setkeycodes.c \
	$(BUSYBOX_PATH)/console-tools/setconsole.c \
	$(BUSYBOX_PATH)/console-tools/showkey.c \
	$(BUSYBOX_PATH)/console-tools/clear.c \
	$(BUSYBOX_PATH)/coreutils/truncate.c \
	$(BUSYBOX_PATH)/coreutils/id.c \
	$(BUSYBOX_PATH)/coreutils/wc.c \
	$(BUSYBOX_PATH)/coreutils/chmod.c \
	$(BUSYBOX_PATH)/coreutils/test.c \
	$(BUSYBOX_PATH)/coreutils/mkfifo.c \
	$(BUSYBOX_PATH)/coreutils/basename.c \
	$(BUSYBOX_PATH)/coreutils/touch.c \
	$(BUSYBOX_PATH)/coreutils/chown.c \
	$(BUSYBOX_PATH)/coreutils/dd.c \
	$(BUSYBOX_PATH)/coreutils/mkdir.c \
	$(BUSYBOX_PATH)/coreutils/tail.c \
	$(BUSYBOX_PATH)/coreutils/readlink.c \
	$(BUSYBOX_PATH)/coreutils/install.c \
	$(BUSYBOX_PATH)/coreutils/tr.c \
	$(BUSYBOX_PATH)/coreutils/expr.c \
	$(BUSYBOX_PATH)/coreutils/realpath.c \
	$(BUSYBOX_PATH)/coreutils/split.c \
	$(BUSYBOX_PATH)/coreutils/cal.c \
	$(BUSYBOX_PATH)/coreutils/shuf.c \
	$(BUSYBOX_PATH)/coreutils/rmdir.c \
	$(BUSYBOX_PATH)/coreutils/nice.c \
	$(BUSYBOX_PATH)/coreutils/df.c \
	$(BUSYBOX_PATH)/coreutils/whoami.c \
	$(BUSYBOX_PATH)/coreutils/yes.c \
	$(BUSYBOX_PATH)/coreutils/uuencode.c \
	$(BUSYBOX_PATH)/coreutils/printf.c \
	$(BUSYBOX_PATH)/coreutils/du.c \
	$(BUSYBOX_PATH)/coreutils/env.c \
	$(BUSYBOX_PATH)/coreutils/catv.c \
	$(BUSYBOX_PATH)/coreutils/od.c \
	$(BUSYBOX_PATH)/coreutils/chroot.c \
	$(BUSYBOX_PATH)/coreutils/hostid.c \
	$(BUSYBOX_PATH)/coreutils/logname.c \
	$(BUSYBOX_PATH)/coreutils/mv.c \
	$(BUSYBOX_PATH)/coreutils/usleep.c \
	$(BUSYBOX_PATH)/coreutils/tty.c \
	$(BUSYBOX_PATH)/coreutils/chgrp.c \
	$(BUSYBOX_PATH)/coreutils/stty.c \
	$(BUSYBOX_PATH)/coreutils/sort.c \
	$(BUSYBOX_PATH)/coreutils/fold.c \
	$(BUSYBOX_PATH)/coreutils/ls.c \
	$(BUSYBOX_PATH)/coreutils/seq.c \
	$(BUSYBOX_PATH)/coreutils/uname.c \
	$(BUSYBOX_PATH)/coreutils/test_ptr_hack.c \
	$(BUSYBOX_PATH)/coreutils/fsync.c \
	$(BUSYBOX_PATH)/coreutils/stat.c \
	$(BUSYBOX_PATH)/coreutils/tee.c \
	$(BUSYBOX_PATH)/coreutils/uniq.c \
	$(BUSYBOX_PATH)/coreutils/ln.c \
	$(BUSYBOX_PATH)/coreutils/nohup.c \
	$(BUSYBOX_PATH)/coreutils/cut.c \
	$(BUSYBOX_PATH)/coreutils/sum.c \
	$(BUSYBOX_PATH)/coreutils/dirname.c \
	$(BUSYBOX_PATH)/coreutils/date.c \
	$(BUSYBOX_PATH)/coreutils/dos2unix.c \
	$(BUSYBOX_PATH)/coreutils/sync.c \
	$(BUSYBOX_PATH)/coreutils/true.c \
	$(BUSYBOX_PATH)/coreutils/printenv.c \
	$(BUSYBOX_PATH)/coreutils/md5_sha1_sum.c \
	$(BUSYBOX_PATH)/coreutils/libcoreutils/cp_mv_stat.c \
	$(BUSYBOX_PATH)/coreutils/libcoreutils/getopt_mk_fifo_nod.c \
	$(BUSYBOX_PATH)/coreutils/rm.c \
	$(BUSYBOX_PATH)/coreutils/sleep.c \
	$(BUSYBOX_PATH)/coreutils/false.c \
	$(BUSYBOX_PATH)/coreutils/cksum.c \
	$(BUSYBOX_PATH)/coreutils/unlink.c \
	$(BUSYBOX_PATH)/coreutils/mknod.c \
	$(BUSYBOX_PATH)/coreutils/echo.c \
	$(BUSYBOX_PATH)/coreutils/tac.c \
	$(BUSYBOX_PATH)/coreutils/expand.c \
	$(BUSYBOX_PATH)/coreutils/comm.c \
	$(BUSYBOX_PATH)/coreutils/head.c \
	$(BUSYBOX_PATH)/coreutils/cat.c \
	$(BUSYBOX_PATH)/coreutils/cp.c \
	$(BUSYBOX_PATH)/coreutils/uudecode.c \
	$(BUSYBOX_PATH)/coreutils/pwd.c \
	$(BUSYBOX_PATH)/debianutils/start_stop_daemon.c \
	$(BUSYBOX_PATH)/debianutils/which.c \
	$(BUSYBOX_PATH)/debianutils/mktemp.c \
	$(BUSYBOX_PATH)/debianutils/pipe_progress.c \
	$(BUSYBOX_PATH)/debianutils/run_parts.c \
	$(BUSYBOX_PATH)/e2fsprogs/chattr.c \
	$(BUSYBOX_PATH)/e2fsprogs/tune2fs.c \
	$(BUSYBOX_PATH)/e2fsprogs/lsattr.c \
	$(BUSYBOX_PATH)/e2fsprogs/e2fs_lib.c \
	$(BUSYBOX_PATH)/e2fsprogs/fsck.c \
	$(BUSYBOX_PATH)/editors/vi.c \
	$(BUSYBOX_PATH)/editors/patch_bbox.c \
	$(BUSYBOX_PATH)/editors/cmp.c \
	$(BUSYBOX_PATH)/editors/patch_toybox.c \
	$(BUSYBOX_PATH)/editors/ed.c \
	$(BUSYBOX_PATH)/editors/patch.c \
	$(BUSYBOX_PATH)/editors/sed.c \
	$(BUSYBOX_PATH)/editors/awk.c \
	$(BUSYBOX_PATH)/editors/diff.c \
	$(BUSYBOX_PATH)/findutils/grep.c \
	$(BUSYBOX_PATH)/findutils/xargs.c \
	$(BUSYBOX_PATH)/findutils/find.c \
	$(BUSYBOX_PATH)/init/mesg.c \
	$(BUSYBOX_PATH)/init/bootchartd.c \
	$(BUSYBOX_PATH)/init/halt.c \
	$(BUSYBOX_PATH)/init/init.c \
	$(BUSYBOX_PATH)/libbb/fclose_nonstdin.c \
	$(BUSYBOX_PATH)/libbb/device_open.c \
	$(BUSYBOX_PATH)/libbb/bb_pwd.c \
	$(BUSYBOX_PATH)/libbb/parse_config.c \
	$(BUSYBOX_PATH)/libbb/concat_subpath_file.c \
	$(BUSYBOX_PATH)/libbb/perror_nomsg_and_die.c \
	$(BUSYBOX_PATH)/libbb/u_signal_names.c \
	$(BUSYBOX_PATH)/libbb/parse_mode.c \
	$(BUSYBOX_PATH)/libbb/safe_poll.c \
	$(BUSYBOX_PATH)/libbb/inet_cksum.c \
	$(BUSYBOX_PATH)/libbb/printable_string.c \
	$(BUSYBOX_PATH)/libbb/get_line_from_file.c \
	$(BUSYBOX_PATH)/libbb/makedev.c \
	$(BUSYBOX_PATH)/libbb/logenv.c \
	$(BUSYBOX_PATH)/libbb/login.c \
	$(BUSYBOX_PATH)/libbb/safe_gethostname.c \
	$(BUSYBOX_PATH)/libbb/obscure.c \
	$(BUSYBOX_PATH)/libbb/printable.c \
	$(BUSYBOX_PATH)/libbb/copyfd.c \
	$(BUSYBOX_PATH)/libbb/chomp.c \
	$(BUSYBOX_PATH)/libbb/nuke_str.c \
	$(BUSYBOX_PATH)/libbb/selinux_common.c \
	$(BUSYBOX_PATH)/libbb/remove_file.c \
	$(BUSYBOX_PATH)/libbb/find_mount_point.c \
	$(BUSYBOX_PATH)/libbb/platform.c \
	$(BUSYBOX_PATH)/libbb/utmp.c \
	$(BUSYBOX_PATH)/libbb/read_printf.c \
	$(BUSYBOX_PATH)/libbb/percent_decode.c \
	$(BUSYBOX_PATH)/libbb/single_argv.c \
	$(BUSYBOX_PATH)/libbb/compare_string_array.c \
	$(BUSYBOX_PATH)/libbb/default_error_retval.c \
	$(BUSYBOX_PATH)/libbb/crc32.c \
	$(BUSYBOX_PATH)/libbb/xconnect.c \
	$(BUSYBOX_PATH)/libbb/simplify_path.c \
	$(BUSYBOX_PATH)/libbb/pidfile.c \
	$(BUSYBOX_PATH)/libbb/mode_string.c \
	$(BUSYBOX_PATH)/libbb/xgetcwd.c \
	$(BUSYBOX_PATH)/libbb/get_shell_name.c \
	$(BUSYBOX_PATH)/libbb/make_directory.c \
	$(BUSYBOX_PATH)/libbb/perror_nomsg.c \
	$(BUSYBOX_PATH)/libbb/xregcomp.c \
	$(BUSYBOX_PATH)/libbb/udp_io.c \
	$(BUSYBOX_PATH)/libbb/process_escape_sequence.c \
	$(BUSYBOX_PATH)/libbb/replace.c \
	$(BUSYBOX_PATH)/libbb/xfuncs.c \
	$(BUSYBOX_PATH)/libbb/human_readable.c \
	$(BUSYBOX_PATH)/libbb/wfopen.c \
	$(BUSYBOX_PATH)/libbb/read_key.c \
	$(BUSYBOX_PATH)/libbb/full_write.c \
	$(BUSYBOX_PATH)/libbb/time.c \
	$(BUSYBOX_PATH)/libbb/hash_md5_sha.c \
	$(BUSYBOX_PATH)/libbb/get_console.c \
	$(BUSYBOX_PATH)/libbb/get_last_path_component.c \
	$(BUSYBOX_PATH)/libbb/bb_strtonum.c \
	$(BUSYBOX_PATH)/libbb/missing_syscalls.c \
	$(BUSYBOX_PATH)/libbb/ask_confirmation.c \
	$(BUSYBOX_PATH)/libbb/xfuncs_printf.c \
	$(BUSYBOX_PATH)/libbb/isdirectory.c \
	$(BUSYBOX_PATH)/libbb/in_ether.c \
	$(BUSYBOX_PATH)/libbb/recursive_action.c \
	$(BUSYBOX_PATH)/libbb/bb_bswap_64.c \
	$(BUSYBOX_PATH)/libbb/lineedit_ptr_hack.c \
	$(BUSYBOX_PATH)/libbb/signals.c \
	$(BUSYBOX_PATH)/libbb/safe_write.c \
	$(BUSYBOX_PATH)/libbb/print_flags.c \
	$(BUSYBOX_PATH)/libbb/uuencode.c \
	$(BUSYBOX_PATH)/libbb/find_root_device.c \
	$(BUSYBOX_PATH)/libbb/str_tolower.c \
	$(BUSYBOX_PATH)/libbb/getopt32.c \
	$(BUSYBOX_PATH)/libbb/endofname.c \
	$(BUSYBOX_PATH)/libbb/update_passwd.c \
	$(BUSYBOX_PATH)/libbb/last_char_is.c \
	$(BUSYBOX_PATH)/libbb/setup_environment.c \
	$(BUSYBOX_PATH)/libbb/info_msg.c \
	$(BUSYBOX_PATH)/libbb/rtc.c \
	$(BUSYBOX_PATH)/libbb/mtab.c \
	$(BUSYBOX_PATH)/libbb/change_identity.c \
	$(BUSYBOX_PATH)/libbb/perror_msg.c \
	$(BUSYBOX_PATH)/libbb/warn_ignoring_args.c \
	$(BUSYBOX_PATH)/libbb/get_volsize.c \
	$(BUSYBOX_PATH)/libbb/inet_common.c \
	$(BUSYBOX_PATH)/libbb/messages.c \
	$(BUSYBOX_PATH)/libbb/fgets_str.c \
	$(BUSYBOX_PATH)/libbb/hash_md5prime.c \
	$(BUSYBOX_PATH)/libbb/vfork_daemon_rexec.c \
	$(BUSYBOX_PATH)/libbb/get_cpu_count.c \
	$(BUSYBOX_PATH)/libbb/fflush_stdout_and_exit.c \
	$(BUSYBOX_PATH)/libbb/executable.c \
	$(BUSYBOX_PATH)/libbb/copy_file.c \
	$(BUSYBOX_PATH)/libbb/trim.c \
	$(BUSYBOX_PATH)/libbb/xfunc_die.c \
	$(BUSYBOX_PATH)/libbb/lineedit.c \
	$(BUSYBOX_PATH)/libbb/bb_askpass.c \
	$(BUSYBOX_PATH)/libbb/dump.c \
	$(BUSYBOX_PATH)/libbb/read.c \
	$(BUSYBOX_PATH)/libbb/die_if_bad_username.c \
	$(BUSYBOX_PATH)/libbb/write.c \
	$(BUSYBOX_PATH)/libbb/skip_whitespace.c \
	$(BUSYBOX_PATH)/libbb/procps.c \
	$(BUSYBOX_PATH)/libbb/wfopen_input.c \
	$(BUSYBOX_PATH)/libbb/bbunit.c \
	$(BUSYBOX_PATH)/libbb/bb_qsort.c \
	$(BUSYBOX_PATH)/libbb/concat_path_file.c \
	$(BUSYBOX_PATH)/libbb/correct_password.c \
	$(BUSYBOX_PATH)/libbb/run_shell.c \
	$(BUSYBOX_PATH)/libbb/kernel_version.c \
	$(BUSYBOX_PATH)/libbb/progress.c \
	$(BUSYBOX_PATH)/libbb/xrealloc_vector.c \
	$(BUSYBOX_PATH)/libbb/xgethostbyname.c \
	$(BUSYBOX_PATH)/libbb/inode_hash.c \
	$(BUSYBOX_PATH)/libbb/speed_table.c \
	$(BUSYBOX_PATH)/libbb/loop.c \
	$(BUSYBOX_PATH)/libbb/ptr_to_globals.c \
	$(BUSYBOX_PATH)/libbb/pw_encrypt.c \
	$(BUSYBOX_PATH)/libbb/bb_do_delay.c \
	$(BUSYBOX_PATH)/libbb/systemd_support.c \
	$(BUSYBOX_PATH)/libbb/appletlib.c \
	$(BUSYBOX_PATH)/libbb/match_fstype.c \
	$(BUSYBOX_PATH)/libbb/herror_msg.c \
	$(BUSYBOX_PATH)/libbb/safe_strncpy.c \
	$(BUSYBOX_PATH)/libbb/xreadlink.c \
	$(BUSYBOX_PATH)/libbb/xatonum_template.c \
	$(BUSYBOX_PATH)/libbb/auto_string.c \
	$(BUSYBOX_PATH)/libbb/sysconf.c \
	$(BUSYBOX_PATH)/libbb/vdprintf.c \
	$(BUSYBOX_PATH)/libbb/llist.c \
	$(BUSYBOX_PATH)/libbb/getpty.c \
	$(BUSYBOX_PATH)/libbb/bb_strtod.c \
	$(BUSYBOX_PATH)/libbb/unicode.c \
	$(BUSYBOX_PATH)/libbb/verror_msg.c \
	$(BUSYBOX_PATH)/libbb/find_pid_by_name.c \
	$(BUSYBOX_PATH)/libbb/strrstr.c \
	$(BUSYBOX_PATH)/libpwdgrp/uidgid_get.c \
	$(BUSYBOX_PATH)/libpwdgrp/pwd_grp.c \
	$(BUSYBOX_PATH)/loginutils/sulogin.c \
	$(BUSYBOX_PATH)/loginutils/su.c \
	$(BUSYBOX_PATH)/loginutils/login.c \
	$(BUSYBOX_PATH)/loginutils/adduser.c \
	$(BUSYBOX_PATH)/loginutils/cryptpw.c \
	$(BUSYBOX_PATH)/loginutils/add-remove-shell.c \
	$(BUSYBOX_PATH)/loginutils/getty.c \
	$(BUSYBOX_PATH)/loginutils/passwd.c \
	$(BUSYBOX_PATH)/loginutils/addgroup.c \
	$(BUSYBOX_PATH)/loginutils/chpasswd.c \
	$(BUSYBOX_PATH)/loginutils/deluser.c \
	$(BUSYBOX_PATH)/loginutils/vlock.c \
	$(BUSYBOX_PATH)/miscutils/fbsplash.c \
	$(BUSYBOX_PATH)/miscutils/mountpoint.c \
	$(BUSYBOX_PATH)/miscutils/raidautorun.c \
	$(BUSYBOX_PATH)/miscutils/conspy.c \
	$(BUSYBOX_PATH)/miscutils/readahead.c \
	$(BUSYBOX_PATH)/miscutils/eject.c \
	$(BUSYBOX_PATH)/miscutils/crontab.c \
	$(BUSYBOX_PATH)/miscutils/dc.c \
	$(BUSYBOX_PATH)/miscutils/ionice.c \
	$(BUSYBOX_PATH)/miscutils/inotifyd.c \
	$(BUSYBOX_PATH)/miscutils/adjtimex.c \
	$(BUSYBOX_PATH)/miscutils/watchdog.c \
	$(BUSYBOX_PATH)/miscutils/devfsd.c \
	$(BUSYBOX_PATH)/miscutils/chat.c \
	$(BUSYBOX_PATH)/miscutils/time.c \
	$(BUSYBOX_PATH)/miscutils/i2c_tools.c \
	$(BUSYBOX_PATH)/miscutils/runlevel.c \
	$(BUSYBOX_PATH)/miscutils/volname.c \
	$(BUSYBOX_PATH)/miscutils/flash_lock_unlock.c \
	$(BUSYBOX_PATH)/miscutils/taskset.c \
	$(BUSYBOX_PATH)/miscutils/makedevs.c \
	$(BUSYBOX_PATH)/miscutils/ttysize.c \
	$(BUSYBOX_PATH)/miscutils/last_fancy.c \
	$(BUSYBOX_PATH)/miscutils/beep.c \
	$(BUSYBOX_PATH)/miscutils/ubi_tools.c \
	$(BUSYBOX_PATH)/miscutils/setsid.c \
	$(BUSYBOX_PATH)/miscutils/chrt.c \
	$(BUSYBOX_PATH)/miscutils/crond.c \
	$(BUSYBOX_PATH)/miscutils/man.c \
	$(BUSYBOX_PATH)/miscutils/nandwrite.c \
	$(BUSYBOX_PATH)/miscutils/rx.c \
	$(BUSYBOX_PATH)/miscutils/devmem.c \
	$(BUSYBOX_PATH)/miscutils/hdparm.c \
	$(BUSYBOX_PATH)/miscutils/setserial.c \
	$(BUSYBOX_PATH)/miscutils/strings.c \
	$(BUSYBOX_PATH)/miscutils/rfkill.c \
	$(BUSYBOX_PATH)/miscutils/mt.c \
	$(BUSYBOX_PATH)/miscutils/bbconfig.c \
	$(BUSYBOX_PATH)/miscutils/timeout.c \
	$(BUSYBOX_PATH)/miscutils/last.c \
	$(BUSYBOX_PATH)/miscutils/flashcp.c \
	$(BUSYBOX_PATH)/miscutils/less.c \
	$(BUSYBOX_PATH)/miscutils/flash_eraseall.c \
	$(BUSYBOX_PATH)/miscutils/wall.c \
	$(BUSYBOX_PATH)/miscutils/microcom.c \
	$(BUSYBOX_PATH)/modutils/modprobe.c \
	$(BUSYBOX_PATH)/modutils/depmod.c \
	$(BUSYBOX_PATH)/modutils/lsmod.c \
	$(BUSYBOX_PATH)/modutils/modinfo.c \
	$(BUSYBOX_PATH)/modutils/insmod.c \
	$(BUSYBOX_PATH)/modutils/modprobe-small.c \
	$(BUSYBOX_PATH)/modutils/rmmod.c \
	$(BUSYBOX_PATH)/modutils/modutils-24.c \
	$(BUSYBOX_PATH)/modutils/modutils.c \
	$(BUSYBOX_PATH)/networking/ip.c \
	$(BUSYBOX_PATH)/networking/tcpudp_perhost.c \
	$(BUSYBOX_PATH)/networking/httpd.c \
	$(BUSYBOX_PATH)/networking/tc.c \
	$(BUSYBOX_PATH)/networking/tcpudp.c \
	$(BUSYBOX_PATH)/networking/ifplugd.c \
	$(BUSYBOX_PATH)/networking/pscan.c \
	$(BUSYBOX_PATH)/networking/whois.c \
	$(BUSYBOX_PATH)/networking/ftpgetput.c \
	$(BUSYBOX_PATH)/networking/vconfig.c \
	$(BUSYBOX_PATH)/networking/tftp.c \
	$(BUSYBOX_PATH)/networking/ping.c \
	$(BUSYBOX_PATH)/networking/isrv_identd.c \
	$(BUSYBOX_PATH)/networking/slattach.c \
	$(BUSYBOX_PATH)/networking/interface.c \
	$(BUSYBOX_PATH)/networking/nc_bloaty.c \
	$(BUSYBOX_PATH)/networking/libiproute/iptunnel.c \
	$(BUSYBOX_PATH)/networking/libiproute/ll_map.c \
	$(BUSYBOX_PATH)/networking/libiproute/ipaddress.c \
	$(BUSYBOX_PATH)/networking/libiproute/iplink.c \
	$(BUSYBOX_PATH)/networking/libiproute/libnetlink.c \
	$(BUSYBOX_PATH)/networking/libiproute/ll_addr.c \
	$(BUSYBOX_PATH)/networking/libiproute/rt_names.c \
	$(BUSYBOX_PATH)/networking/libiproute/ip_parse_common_args.c \
	$(BUSYBOX_PATH)/networking/libiproute/rtm_map.c \
	$(BUSYBOX_PATH)/networking/libiproute/ll_proto.c \
	$(BUSYBOX_PATH)/networking/libiproute/ll_types.c \
	$(BUSYBOX_PATH)/networking/libiproute/utils.c \
	$(BUSYBOX_PATH)/networking/libiproute/iproute.c \
	$(BUSYBOX_PATH)/networking/libiproute/iprule.c \
	$(BUSYBOX_PATH)/networking/ftpd.c \
	$(BUSYBOX_PATH)/networking/nbd-client.c \
	$(BUSYBOX_PATH)/networking/ntpd.c \
	$(BUSYBOX_PATH)/networking/ssl_helper/ssl_helper.c \
	$(BUSYBOX_PATH)/networking/arp.c \
	$(BUSYBOX_PATH)/networking/zcip.c \
	$(BUSYBOX_PATH)/networking/dnsd.c \
	$(BUSYBOX_PATH)/networking/ifenslave.c \
	$(BUSYBOX_PATH)/networking/telnetd.c \
	$(BUSYBOX_PATH)/networking/ifconfig.c \
	$(BUSYBOX_PATH)/networking/ifupdown.c \
	$(BUSYBOX_PATH)/networking/hostname.c \
	$(BUSYBOX_PATH)/networking/httpd_ssi.c \
	$(BUSYBOX_PATH)/networking/isrv.c \
	$(BUSYBOX_PATH)/networking/ipcalc.c \
	$(BUSYBOX_PATH)/networking/ether-wake.c \
	$(BUSYBOX_PATH)/networking/traceroute.c \
	$(BUSYBOX_PATH)/networking/route.c \
	$(BUSYBOX_PATH)/networking/tunctl.c \
	$(BUSYBOX_PATH)/networking/nameif.c \
	$(BUSYBOX_PATH)/networking/telnet.c \
	$(BUSYBOX_PATH)/networking/netstat.c \
	$(BUSYBOX_PATH)/networking/nc.c \
	$(BUSYBOX_PATH)/networking/nslookup.c \
	$(BUSYBOX_PATH)/networking/arping.c \
	$(BUSYBOX_PATH)/networking/udhcp/socket.c \
	$(BUSYBOX_PATH)/networking/udhcp/domain_codec.c \
	$(BUSYBOX_PATH)/networking/udhcp/files.c \
	$(BUSYBOX_PATH)/networking/udhcp/dhcprelay.c \
	$(BUSYBOX_PATH)/networking/udhcp/dhcpc.c \
	$(BUSYBOX_PATH)/networking/udhcp/d6_packet.c \
	$(BUSYBOX_PATH)/networking/udhcp/static_leases.c \
	$(BUSYBOX_PATH)/networking/udhcp/signalpipe.c \
	$(BUSYBOX_PATH)/networking/udhcp/dhcpd.c \
	$(BUSYBOX_PATH)/networking/udhcp/d6_socket.c \
	$(BUSYBOX_PATH)/networking/udhcp/leases.c \
	$(BUSYBOX_PATH)/networking/udhcp/dumpleases.c \
	$(BUSYBOX_PATH)/networking/udhcp/packet.c \
	$(BUSYBOX_PATH)/networking/udhcp/common.c \
	$(BUSYBOX_PATH)/networking/udhcp/d6_dhcpc.c \
	$(BUSYBOX_PATH)/networking/udhcp/arpping.c \
	$(BUSYBOX_PATH)/networking/inetd.c \
	$(BUSYBOX_PATH)/networking/ssl_helper-wolfssl/ssl_helper.c \
	$(BUSYBOX_PATH)/networking/httpd_indexcgi.c \
	$(BUSYBOX_PATH)/networking/brctl.c \
	$(BUSYBOX_PATH)/networking/wget.c \
	$(BUSYBOX_PATH)/procps/pmap.c \
	$(BUSYBOX_PATH)/procps/fuser.c \
	$(BUSYBOX_PATH)/procps/mpstat.c \
	$(BUSYBOX_PATH)/procps/uptime.c \
	$(BUSYBOX_PATH)/procps/renice.c \
	$(BUSYBOX_PATH)/procps/pwdx.c \
	$(BUSYBOX_PATH)/procps/sysctl.c \
	$(BUSYBOX_PATH)/procps/watch.c \
	$(BUSYBOX_PATH)/procps/kill.c \
	$(BUSYBOX_PATH)/procps/free.c \
	$(BUSYBOX_PATH)/procps/pidof.c \
	$(BUSYBOX_PATH)/procps/nmeter.c \
	$(BUSYBOX_PATH)/procps/pgrep.c \
	$(BUSYBOX_PATH)/procps/iostat.c \
	$(BUSYBOX_PATH)/procps/ps.c \
	$(BUSYBOX_PATH)/procps/pstree.c \
	$(BUSYBOX_PATH)/procps/smemcap.c \
	$(BUSYBOX_PATH)/procps/lsof.c \
	$(BUSYBOX_PATH)/procps/powertop.c \
	$(BUSYBOX_PATH)/procps/top.c \
	$(BUSYBOX_PATH)/runit/runsvdir.c \
	$(BUSYBOX_PATH)/runit/sv.c \
	$(BUSYBOX_PATH)/runit/chpst.c \
	$(BUSYBOX_PATH)/runit/runsv.c \
	$(BUSYBOX_PATH)/runit/svlogd.c \
	$(BUSYBOX_PATH)/selinux/setsebool.c \
	$(BUSYBOX_PATH)/selinux/getenforce.c \
	$(BUSYBOX_PATH)/selinux/matchpathcon.c \
	$(BUSYBOX_PATH)/selinux/load_policy.c \
	$(BUSYBOX_PATH)/selinux/sestatus.c \
	$(BUSYBOX_PATH)/selinux/chcon.c \
	$(BUSYBOX_PATH)/selinux/setfiles.c \
	$(BUSYBOX_PATH)/selinux/runcon.c \
	$(BUSYBOX_PATH)/selinux/selinuxenabled.c \
	$(BUSYBOX_PATH)/selinux/getsebool.c \
	$(BUSYBOX_PATH)/selinux/setenforce.c \
	$(BUSYBOX_PATH)/shell/random.c \
	$(BUSYBOX_PATH)/shell/hush.c \
	$(BUSYBOX_PATH)/shell/math.c \
	$(BUSYBOX_PATH)/shell/shell_common.c \
	$(BUSYBOX_PATH)/shell/ash_ptr_hack.c \
	$(BUSYBOX_PATH)/shell/cttyhack.c \
	$(BUSYBOX_PATH)/shell/ash.c \
	$(BUSYBOX_PATH)/shell/match.c \
	$(BUSYBOX_PATH)/util-linux/blockdev.c \
	$(BUSYBOX_PATH)/util-linux/uevent.c \
	$(BUSYBOX_PATH)/util-linux/umount.c \
	$(BUSYBOX_PATH)/util-linux/lsusb.c \
	$(BUSYBOX_PATH)/util-linux/mkfs_reiser.c \
	$(BUSYBOX_PATH)/util-linux/fbset.c \
	$(BUSYBOX_PATH)/util-linux/lspci.c \
	$(BUSYBOX_PATH)/util-linux/rev.c \
	$(BUSYBOX_PATH)/util-linux/script.c \
	$(BUSYBOX_PATH)/util-linux/rdate.c \
	$(BUSYBOX_PATH)/util-linux/getopt.c \
	$(BUSYBOX_PATH)/util-linux/swaponoff.c \
	$(BUSYBOX_PATH)/util-linux/ipcs.c \
	$(BUSYBOX_PATH)/util-linux/fstrim.c \
	$(BUSYBOX_PATH)/util-linux/flock.c \
	$(BUSYBOX_PATH)/util-linux/fdisk.c \
	$(BUSYBOX_PATH)/util-linux/mkfs_vfat.c \
	$(BUSYBOX_PATH)/util-linux/ipcrm.c \
	$(BUSYBOX_PATH)/util-linux/hwclock.c \
	$(BUSYBOX_PATH)/util-linux/mdev.c \
	$(BUSYBOX_PATH)/util-linux/pivot_root.c \
	$(BUSYBOX_PATH)/util-linux/blkid.c \
	$(BUSYBOX_PATH)/util-linux/losetup.c \
	$(BUSYBOX_PATH)/util-linux/setarch.c \
	$(BUSYBOX_PATH)/util-linux/hexdump.c \
	$(BUSYBOX_PATH)/util-linux/findfs.c \
	$(BUSYBOX_PATH)/util-linux/rtcwake.c \
	$(BUSYBOX_PATH)/util-linux/acpid.c \
	$(BUSYBOX_PATH)/util-linux/switch_root.c \
	$(BUSYBOX_PATH)/util-linux/fatattr.c \
	$(BUSYBOX_PATH)/util-linux/readprofile.c \
	$(BUSYBOX_PATH)/util-linux/rdev.c \
	$(BUSYBOX_PATH)/util-linux/mkswap.c \
	$(BUSYBOX_PATH)/util-linux/fdformat.c \
	$(BUSYBOX_PATH)/util-linux/scriptreplay.c \
	$(BUSYBOX_PATH)/util-linux/mount.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/romfs.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/unused_nvidia_raid.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/ntfs.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/btrfs.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/fat.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/unused_lvm.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/iso9660.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/luks.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/nilfs.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/xfs.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/unused_highpoint.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/unused_mac.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/sysv.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/unused_silicon_raid.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/exfat.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/hfs.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/reiserfs.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/jfs.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/linux_swap.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/unused_lsi_raid.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/unused_hpfs.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/ext.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/unused_isw_raid.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/unused_msdos.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/unused_promise_raid.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/ocfs2.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/cramfs.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/udf.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/squashfs.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/unused_minix.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/volume_id.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/unused_via_raid.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/unused_ufs.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/util.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/get_devname.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/linux_raid.c \
	$(BUSYBOX_PATH)/util-linux/volume_id/f2fs.c \
	$(BUSYBOX_PATH)/util-linux/more.c \
	$(BUSYBOX_PATH)/util-linux/dmesg.c \
	$(BUSYBOX_PATH)/util-linux/fsck_minix.c \
	$(BUSYBOX_PATH)/util-linux/freeramdisk.c \
	$(BUSYBOX_PATH)/util-linux/mkfs_minix.c \
	$(BUSYBOX_PATH)/util-linux/mkfs_ext2.c

LOCAL_SRC_FILES := $(BUSYBOX_SRCS)
LOCAL_C_INCLUDES:= busybox/include
# LOCAL_LDLIBS    := -lz
LOCAL_LDFLAGS   := -static

include $(BUILD_EXECUTABLE)
