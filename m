Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4333A1A41;
	Thu, 21 May 2026 10:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358748; cv=none; b=YeMKz3biCopVmY25LZewJoj3QIyMBFmHrHYK+gNxSNeI8xlO0a5vbdXKRcIghA5Ge+DgBdywbiprkMI+6Qw1Z2ulTehxrVsI92gLMGgN4XQ5TByIw4aF+2H1OUYFgEHcS6k/c0+OtzrRj6SgyYbKGnELsj5DVZtsSSGtdopSDgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358748; c=relaxed/simple;
	bh=nJRZgWyg1LJeyLDvbQhH9zcAdpnva1/TzavEBYbC5Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jeciqw500/h9w/0wTg04dgoI70aZE39v27oAAY799ZDM179p0C7M63qbgso2hYjqCG2yFvmmXi4hUwJDlPwSqrMqvL8iA9ZS3HOQPB+uwu9NLZTGKIol1stt745PIadOw9prHVhSiOns2G4qXmG0Yry2JnkdezVVNpVmj/GfBhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QRL1CF47; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QRL1CF47"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 885EF1F000E9;
	Thu, 21 May 2026 10:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779358746;
	bh=orBQdBpmChGAmt/tDT+WkqP7UYQ2wbg5SOPNbJu4wuU=;
	h=Date:From:To:Cc:Subject;
	b=QRL1CF47RpLOqO82gQ0VPkMq/Qt9jSxwPdL/mVxsO0XQcc0IjjswQTwswJfDVG6MC
	 4Zt82sNIDiALNOHssxQ8eiP7e5BJUKRxviylMcG1vxYaBQWhXK0kG/lDSRVC+xVNHN
	 ODcSWlDsrsJv83sdMSI68A0B+13Lg+BVjBx7kLmLDvuiKjRccfCN2ERjHNX9ihBcT3
	 nsEHYqWRoNHTDZr5wc3eXXpfgLeRleVjIsT6NAsYKqK55HO+NuVZag9RFTdlVEw2sr
	 QdDHm3r2CkhUlbJlKt9IGsWJzPZXGWUGeGjyfuew6Y/CW4nejWMFMsB/yfQfj0jkVO
	 xjBS10p1HQVaQ==
Date: Thu, 21 May 2026 11:19:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Ian Rogers <irogers@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the perf tree with the origin tree
Message-ID: <ag7cF9XqINQyrq6f@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4wa2f8IEWXy0xJQ+"
Content-Disposition: inline


--4wa2f8IEWXy0xJQ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the perf tree got a conflict in:

  tools/perf/Makefile.perf

between commit:

  552636b9317c8 ("perf trace: Add beautifier script for fsmount flags")

=66rom the origin tree and commits:

  32969ef6e3e19 ("perf build: Pre-generate BPF skeleton tooling during umbr=
ella prepare phase")
  537609924c437 ("perf trace beauty: Make beauty generated C code standalon=
e .o files")

=66rom the perf tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc tools/perf/Makefile.perf
index 76b35ac19acbf,fc92d6ceac5b0..0000000000000
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@@ -508,232 -509,7 +508,6 @@@ arm64-sysreg-defs-clean
  	$(Q)$(MAKE) -C $(arm64_gen_sysreg_dir) O=3D$(arm64_gen_sysreg_outdir) \
  		prefix=3D subdir=3D clean > /dev/null
 =20
- beauty_linux_dir :=3D $(srctree)/tools/perf/trace/beauty/include/linux/
- beauty_uapi_linux_dir :=3D $(srctree)/tools/perf/trace/beauty/include/uap=
i/linux/
- beauty_uapi_sound_dir :=3D $(srctree)/tools/perf/trace/beauty/include/uap=
i/sound/
- beauty_arch_asm_dir :=3D $(srctree)/tools/perf/trace/beauty/arch/x86/incl=
ude/asm/
- beauty_x86_arch_asm_uapi_dir :=3D $(srctree)/tools/perf/trace/beauty/arch=
/x86/include/uapi/asm/
-=20
- linux_uapi_dir :=3D $(srctree)/tools/include/uapi/linux
- asm_generic_uapi_dir :=3D $(srctree)/tools/include/uapi/asm-generic
- arch_asm_uapi_dir :=3D $(srctree)/tools/arch/$(SRCARCH)/include/uapi/asm/
- x86_arch_asm_dir :=3D $(srctree)/tools/arch/x86/include/asm/
-=20
- beauty_outdir :=3D $(OUTPUT)trace/beauty/generated
- beauty_ioctl_outdir :=3D $(beauty_outdir)/ioctl
-=20
- # Create output directory if not already present
- $(shell [ -d '$(beauty_ioctl_outdir)' ] || mkdir -p '$(beauty_ioctl_outdi=
r)')
-=20
- syscall_array :=3D $(beauty_outdir)/syscalltbl.c
- syscall_tbl :=3D $(srctree)/tools/perf/trace/beauty/syscalltbl.sh
- syscall_tbl_data :=3D $(srctree)/tools/scripts/syscall.tbl \
- 	$(wildcard $(srctree)/tools/perf/arch/*/entry/syscalls/syscall*.tbl)
-=20
- $(syscall_array): $(syscall_tbl) $(syscall_tbl_data)
- 	$(Q)$(SHELL) '$(syscall_tbl)' $(srctree)/tools $@
-=20
- fs_at_flags_array :=3D $(beauty_outdir)/fs_at_flags_array.c
- fs_at_flags_tbl :=3D $(srctree)/tools/perf/trace/beauty/fs_at_flags.sh
-=20
- $(fs_at_flags_array): $(beauty_uapi_linux_dir)/fcntl.h $(fs_at_flags_tbl)
- 	$(Q)$(SHELL) '$(fs_at_flags_tbl)' $(beauty_uapi_linux_dir) > $@
-=20
- clone_flags_array :=3D $(beauty_outdir)/clone_flags_array.c
- clone_flags_tbl :=3D $(srctree)/tools/perf/trace/beauty/clone.sh
-=20
- $(clone_flags_array): $(beauty_uapi_linux_dir)/sched.h $(clone_flags_tbl)
- 	$(Q)$(SHELL) '$(clone_flags_tbl)' $(beauty_uapi_linux_dir) > $@
-=20
- drm_ioctl_array :=3D $(beauty_ioctl_outdir)/drm_ioctl_array.c
- drm_hdr_dir :=3D $(srctree)/tools/perf/trace/beauty/include/uapi/drm
- drm_ioctl_tbl :=3D $(srctree)/tools/perf/trace/beauty/drm_ioctl.sh
-=20
- $(drm_ioctl_array): $(drm_hdr_dir)/drm.h $(drm_hdr_dir)/i915_drm.h $(drm_=
ioctl_tbl)
- 	$(Q)$(SHELL) '$(drm_ioctl_tbl)' $(drm_hdr_dir) > $@
-=20
- fadvise_advice_array :=3D $(beauty_outdir)/fadvise_advice_array.c
- fadvise_advice_tbl :=3D $(srctree)/tools/perf/trace/beauty/fadvise.sh
-=20
- $(fadvise_advice_array): $(beauty_uapi_linux_dir)/fadvise.h $(fadvise_adv=
ice_tbl)
- 	$(Q)$(SHELL) '$(fadvise_advice_tbl)' $(beauty_uapi_linux_dir) > $@
-=20
- fsmount_arrays :=3D $(beauty_outdir)/fsmount_arrays.c
- fsmount_tbls :=3D $(srctree)/tools/perf/trace/beauty/fsmount.sh
-=20
- $(fsmount_arrays): $(beauty_uapi_linux_dir)/mount.h $(fsmount_tbls)
- 	$(Q)$(SHELL) '$(fsmount_tbls)' $(beauty_uapi_linux_dir) > $@
-=20
- fsmount_attr_arrays :=3D $(beauty_outdir)/fsmount_attr_arrays.c
- fsmount_attr_tbls :=3D $(srctree)/tools/perf/trace/beauty/fsmount_attr.sh
-=20
- $(fsmount_attr_arrays): $(beauty_uapi_linux_dir)/mount.h $(fsmount_attr_t=
bls)
- 	$(Q)$(SHELL) '$(fsmount_attr_tbls)' $(beauty_uapi_linux_dir) > $@
-=20
- fspick_arrays :=3D $(beauty_outdir)/fspick_arrays.c
- fspick_tbls :=3D $(srctree)/tools/perf/trace/beauty/fspick.sh
-=20
- $(fspick_arrays): $(beauty_uapi_linux_dir)/mount.h $(fspick_tbls)
- 	$(Q)$(SHELL) '$(fspick_tbls)' $(beauty_uapi_linux_dir) > $@
-=20
- fsconfig_arrays :=3D $(beauty_outdir)/fsconfig_arrays.c
- fsconfig_tbls :=3D $(srctree)/tools/perf/trace/beauty/fsconfig.sh
-=20
- $(fsconfig_arrays): $(beauty_uapi_linux_dir)/mount.h $(fsconfig_tbls)
- 	$(Q)$(SHELL) '$(fsconfig_tbls)' $(beauty_uapi_linux_dir) > $@
-=20
- pkey_alloc_access_rights_array :=3D $(beauty_outdir)/pkey_alloc_access_ri=
ghts_array.c
- asm_generic_hdr_dir :=3D $(srctree)/tools/include/uapi/asm-generic/
- pkey_alloc_access_rights_tbl :=3D $(srctree)/tools/perf/trace/beauty/pkey=
_alloc_access_rights.sh
-=20
- $(pkey_alloc_access_rights_array): $(asm_generic_hdr_dir)/mman-common.h $=
(pkey_alloc_access_rights_tbl)
- 	$(Q)$(SHELL) '$(pkey_alloc_access_rights_tbl)' $(asm_generic_hdr_dir) > =
$@
-=20
- sndrv_ctl_ioctl_array :=3D $(beauty_ioctl_outdir)/sndrv_ctl_ioctl_array.c
- sndrv_ctl_hdr_dir :=3D $(srctree)/tools/include/uapi/sound
- sndrv_ctl_ioctl_tbl :=3D $(srctree)/tools/perf/trace/beauty/sndrv_ctl_ioc=
tl.sh
-=20
- $(sndrv_ctl_ioctl_array): $(beauty_uapi_sound_dir)/asound.h $(sndrv_ctl_i=
octl_tbl)
- 	$(Q)$(SHELL) '$(sndrv_ctl_ioctl_tbl)' $(beauty_uapi_sound_dir) > $@
-=20
- sndrv_pcm_ioctl_array :=3D $(beauty_ioctl_outdir)/sndrv_pcm_ioctl_array.c
- sndrv_pcm_hdr_dir :=3D $(srctree)/tools/include/uapi/sound
- sndrv_pcm_ioctl_tbl :=3D $(srctree)/tools/perf/trace/beauty/sndrv_pcm_ioc=
tl.sh
-=20
- $(sndrv_pcm_ioctl_array): $(beauty_uapi_sound_dir)/asound.h $(sndrv_pcm_i=
octl_tbl)
- 	$(Q)$(SHELL) '$(sndrv_pcm_ioctl_tbl)' $(beauty_uapi_sound_dir) > $@
-=20
- kcmp_type_array :=3D $(beauty_outdir)/kcmp_type_array.c
- kcmp_hdr_dir :=3D $(srctree)/tools/include/uapi/linux/
- kcmp_type_tbl :=3D $(srctree)/tools/perf/trace/beauty/kcmp_type.sh
-=20
- $(kcmp_type_array): $(kcmp_hdr_dir)/kcmp.h $(kcmp_type_tbl)
- 	$(Q)$(SHELL) '$(kcmp_type_tbl)' $(kcmp_hdr_dir) > $@
-=20
- kvm_ioctl_array :=3D $(beauty_ioctl_outdir)/kvm_ioctl_array.c
- kvm_hdr_dir :=3D $(srctree)/tools/include/uapi/linux
- kvm_ioctl_tbl :=3D $(srctree)/tools/perf/trace/beauty/kvm_ioctl.sh
-=20
- $(kvm_ioctl_array): $(kvm_hdr_dir)/kvm.h $(kvm_ioctl_tbl)
- 	$(Q)$(SHELL) '$(kvm_ioctl_tbl)' $(kvm_hdr_dir) > $@
-=20
- socket_arrays :=3D $(beauty_outdir)/socket.c
- socket_tbl :=3D $(srctree)/tools/perf/trace/beauty/socket.sh
-=20
- $(socket_arrays): $(linux_uapi_dir)/in.h $(beauty_linux_dir)/socket.h $(s=
ocket_tbl)
- 	$(Q)$(SHELL) '$(socket_tbl)' $(linux_uapi_dir) $(beauty_linux_dir) > $@
-=20
- sockaddr_arrays :=3D $(beauty_outdir)/sockaddr.c
- sockaddr_tbl :=3D $(srctree)/tools/perf/trace/beauty/sockaddr.sh
-=20
- $(sockaddr_arrays): $(beauty_linux_dir)/socket.h $(sockaddr_tbl)
- 	$(Q)$(SHELL) '$(sockaddr_tbl)' $(beauty_linux_dir) > $@
-=20
- vhost_virtio_ioctl_array :=3D $(beauty_ioctl_outdir)/vhost_virtio_ioctl_a=
rray.c
- vhost_virtio_ioctl_tbl :=3D $(srctree)/tools/perf/trace/beauty/vhost_virt=
io_ioctl.sh
-=20
- $(vhost_virtio_ioctl_array): $(beauty_uapi_linux_dir)/vhost.h $(vhost_vir=
tio_ioctl_tbl)
- 	$(Q)$(SHELL) '$(vhost_virtio_ioctl_tbl)' $(beauty_uapi_linux_dir) > $@
-=20
- perf_ioctl_array :=3D $(beauty_ioctl_outdir)/perf_ioctl_array.c
- perf_hdr_dir :=3D $(srctree)/tools/include/uapi/linux
- perf_ioctl_tbl :=3D $(srctree)/tools/perf/trace/beauty/perf_ioctl.sh
-=20
- $(perf_ioctl_array): $(perf_hdr_dir)/perf_event.h $(perf_ioctl_tbl)
- 	$(Q)$(SHELL) '$(perf_ioctl_tbl)' $(perf_hdr_dir) > $@
-=20
- madvise_behavior_array :=3D $(beauty_outdir)/madvise_behavior_array.c
- madvise_hdr_dir :=3D $(srctree)/tools/include/uapi/asm-generic/
- madvise_behavior_tbl :=3D $(srctree)/tools/perf/trace/beauty/madvise_beha=
vior.sh
-=20
- $(madvise_behavior_array): $(madvise_hdr_dir)/mman-common.h $(madvise_beh=
avior_tbl)
- 	$(Q)$(SHELL) '$(madvise_behavior_tbl)' $(madvise_hdr_dir) > $@
-=20
- mmap_flags_array :=3D $(beauty_outdir)/mmap_flags_array.c
- mmap_flags_tbl :=3D $(srctree)/tools/perf/trace/beauty/mmap_flags.sh
-=20
- $(mmap_flags_array): $(linux_uapi_dir)/mman.h $(asm_generic_uapi_dir)/mma=
n.h $(asm_generic_uapi_dir)/mman-common.h $(mmap_flags_tbl)
- 	$(Q)$(SHELL) '$(mmap_flags_tbl)' $(linux_uapi_dir) $(asm_generic_uapi_di=
r) $(arch_asm_uapi_dir) > $@
-=20
- mremap_flags_array :=3D $(beauty_outdir)/mremap_flags_array.c
- mremap_flags_tbl :=3D $(srctree)/tools/perf/trace/beauty/mremap_flags.sh
-=20
- $(mremap_flags_array): $(linux_uapi_dir)/mman.h $(mremap_flags_tbl)
- 	$(Q)$(SHELL) '$(mremap_flags_tbl)' $(linux_uapi_dir) > $@
-=20
- mount_flags_array :=3D $(beauty_outdir)/mount_flags_array.c
- mount_flags_tbl :=3D $(srctree)/tools/perf/trace/beauty/mount_flags.sh
-=20
- $(mount_flags_array): $(beauty_uapi_linux_dir)/mount.h $(mount_flags_tbl)
- 	$(Q)$(SHELL) '$(mount_flags_tbl)' $(beauty_uapi_linux_dir) > $@
-=20
- move_mount_flags_array :=3D $(beauty_outdir)/move_mount_flags_array.c
- move_mount_flags_tbl :=3D $(srctree)/tools/perf/trace/beauty/move_mount_f=
lags.sh
-=20
- $(move_mount_flags_array): $(beauty_uapi_linux_dir)/mount.h $(move_mount_=
flags_tbl)
- 	$(Q)$(SHELL) '$(move_mount_flags_tbl)' $(beauty_uapi_linux_dir) > $@
-=20
- mmap_prot_array :=3D $(beauty_outdir)/mmap_prot_array.c
- mmap_prot_tbl :=3D $(srctree)/tools/perf/trace/beauty/mmap_prot.sh
-=20
- $(mmap_prot_array): $(asm_generic_uapi_dir)/mman.h $(asm_generic_uapi_dir=
)/mman-common.h $(mmap_prot_tbl)
- 	$(Q)$(SHELL) '$(mmap_prot_tbl)' $(asm_generic_uapi_dir) $(arch_asm_uapi_=
dir) > $@
-=20
- prctl_option_array :=3D $(beauty_outdir)/prctl_option_array.c
- prctl_option_tbl :=3D $(srctree)/tools/perf/trace/beauty/prctl_option.sh
-=20
- $(prctl_option_array): $(beauty_uapi_linux_dir)/prctl.h $(prctl_option_tb=
l)
- 	$(Q)$(SHELL) '$(prctl_option_tbl)' $(beauty_uapi_linux_dir) > $@
-=20
- usbdevfs_ioctl_array :=3D $(beauty_ioctl_outdir)/usbdevfs_ioctl_array.c
- usbdevfs_ioctl_tbl :=3D $(srctree)/tools/perf/trace/beauty/usbdevfs_ioctl=
=2Esh
-=20
- $(usbdevfs_ioctl_array): $(beauty_uapi_linux_dir)/usbdevice_fs.h $(usbdev=
fs_ioctl_tbl)
- 	$(Q)$(SHELL) '$(usbdevfs_ioctl_tbl)' $(beauty_uapi_linux_dir) > $@
-=20
- x86_arch_prctl_code_array :=3D $(beauty_outdir)/x86_arch_prctl_code_array=
=2Ec
- x86_arch_prctl_code_tbl :=3D $(srctree)/tools/perf/trace/beauty/x86_arch_=
prctl.sh
-=20
- $(x86_arch_prctl_code_array): $(beauty_x86_arch_asm_uapi_dir)/prctl.h $(x=
86_arch_prctl_code_tbl)
- 	$(Q)$(SHELL) '$(x86_arch_prctl_code_tbl)' $(beauty_x86_arch_asm_uapi_dir=
) > $@
-=20
- x86_arch_irq_vectors_array :=3D $(beauty_outdir)/x86_arch_irq_vectors_arr=
ay.c
- x86_arch_irq_vectors_tbl :=3D $(srctree)/tools/perf/trace/beauty/tracepoi=
nts/x86_irq_vectors.sh
-=20
- $(x86_arch_irq_vectors_array): $(beauty_arch_asm_dir)/irq_vectors.h $(x86=
_arch_irq_vectors_tbl)
- 	$(Q)$(SHELL) '$(x86_arch_irq_vectors_tbl)' $(beauty_arch_asm_dir) > $@
-=20
- x86_arch_MSRs_array :=3D $(beauty_outdir)/x86_arch_MSRs_array.c
- x86_arch_MSRs_tbl :=3D $(srctree)/tools/perf/trace/beauty/tracepoints/x86=
_msr.sh
-=20
- $(x86_arch_MSRs_array): $(x86_arch_asm_dir)/msr-index.h $(x86_arch_MSRs_t=
bl)
- 	$(Q)$(SHELL) '$(x86_arch_MSRs_tbl)' $(x86_arch_asm_dir) > $@
-=20
- rename_flags_array :=3D $(beauty_outdir)/rename_flags_array.c
- rename_flags_tbl :=3D $(srctree)/tools/perf/trace/beauty/rename_flags.sh
-=20
- $(rename_flags_array): $(beauty_uapi_linux_dir)/fs.h $(rename_flags_tbl)
- 	$(Q)$(SHELL) '$(rename_flags_tbl)' $(beauty_uapi_linux_dir) > $@
-=20
- arch_errno_name_array :=3D $(beauty_outdir)/arch_errno_name_array.c
- arch_errno_hdr_dir :=3D $(srctree)/tools
- arch_errno_tbl :=3D $(srctree)/tools/perf/trace/beauty/arch_errno_names.sh
-=20
- $(arch_errno_name_array): $(arch_errno_tbl)
- 	$(Q)$(SHELL) '$(arch_errno_tbl)' '$(patsubst -%,,$(CC))' $(arch_errno_hd=
r_dir) > $@
-=20
- statx_mask_array :=3D $(beauty_outdir)/statx_mask_array.c
- statx_mask_tbl :=3D $(srctree)/tools/perf/trace/beauty/statx_mask.sh
-=20
- $(statx_mask_array): $(beauty_uapi_linux_dir)/stat.h $(statx_mask_tbl)
- 	$(Q)$(SHELL) '$(statx_mask_tbl)' $(beauty_uapi_linux_dir) > $@
-=20
- sync_file_range_arrays :=3D $(beauty_outdir)/sync_file_range_arrays.c
- sync_file_range_tbls :=3D $(srctree)/tools/perf/trace/beauty/sync_file_ra=
nge.sh
-=20
- $(sync_file_range_arrays): $(beauty_uapi_linux_dir)/fs.h $(sync_file_rang=
e_tbls)
- 	$(Q)$(SHELL) '$(sync_file_range_tbls)' $(beauty_uapi_linux_dir) > $@
--
  TESTS_CORESIGHT_DIR :=3D $(srctree)/tools/perf/tests/shell/coresight
 =20
  tests-coresight-targets: FORCE

--4wa2f8IEWXy0xJQ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoO3BYACgkQJNaLcl1U
h9DLxAf/WM1bwMNTCADEC474FfWCrJMPo+64NdUY5Ihp6RjqF8GG3RF4w0WaYOXS
oYIJPAAn8dKhsf0FZ727Jq2CTpLolV428OnMKeC27eZBa9Olg9uxGJoDH2OXvJeA
FnxUnBR9Ks7Zl32/mo1Q4CkUmqJ3dhE11W+i6VkYQQCBtDJQccJlIOcZUK8CDSq4
i0g2JuhgsUYQiUgvs9r2u6UCNk+/NykndWv4SNy7JDOg13Z0mvi/VPlEReyPVl1u
UeQk6Ex7i8QM/lnLt4EgyN1GI+khMzhKnFd1bfuopEBT8VKr2CT4ImH+GnUYPfJ7
8Cwux0h7yoePaPdzLLW3jJ2E/F2FlQ==
=g1vR
-----END PGP SIGNATURE-----

--4wa2f8IEWXy0xJQ+--
