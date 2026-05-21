Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9DB3812DE;
	Thu, 21 May 2026 17:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779383007; cv=none; b=plmijpTRSFtFYs1b+OhiEffYgQYEFKgagYYaC2mTrKj5nqcv9Gz8gKxoBT/DtWhGuF03oYeSYXbhbH68A9d/ynn732X2loe0ffRzAUg7f5ZUjSSxOgWmmQIEoUplnHHj98sEirElKUy/48b9/13BwBCSs3XFlLdP533S+++Gsbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779383007; c=relaxed/simple;
	bh=A0NFSPFsYJn0UleG0fjOqNSRw4lZMykUU0hqSpQ90lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEPSp2KXJl89ah51b1TdXHBdQRZYtoQiWD7Q9eMYR/idT9iw3yiE6FGUfs5CeJ5grRlDYCx3su8d1g6ngCTDU4mGTeGpckOwawhoj+Yy2jN0pctpn7dFmxx6G71b8RfkOwLQiUHsu0Vpvy6WmpCmK3Ob8cFmjpWdNuv2KwVV7Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yn5EkB9/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yn5EkB9/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2DD21F00A3B;
	Thu, 21 May 2026 17:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779383005;
	bh=DahlHWRy/td2tqb+zg12ejwfm7b4mc2EXA6h5AC/iFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yn5EkB9/x2+fvnPBC92A6/drmZaH56D6GZo3ZMHe3p/0Pok3tPUa9UWJonnyS5RR9
	 A95HvRZ86prr5xFbWfvz95X9XkAhvMQz1fl5Pkfh09v/oc7Mt48hPricUpACklVFl/
	 9iCwtIRwD+D6wyH5JDxfYqz26ciIDxLd2yXcH+xFH/CsR6MJxg+b1vvgEX5nEcgosF
	 hzgyLc/lzTNYkbyYm15mGGUn8VKEv7llTrtUYrhLgS5CeA8zqM0YiritrhyQohKmET
	 NLFfsjKS3MKze+YVYV3mTcVBq9+oU4notnV/wRi08psGn6oM324yvl7qKCxzIaj4Nl
	 rSFtbGjhIgezA==
Date: Thu, 21 May 2026 14:03:21 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Ian Rogers <irogers@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the perf tree with the origin tree
Message-ID: <ag862R7_ducl03Xd@x1>
References: <ag7cF9XqINQyrq6f@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ag7cF9XqINQyrq6f@sirena.org.uk>

On Thu, May 21, 2026 at 11:19:03AM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the perf tree got a conflict in:
> 
>   tools/perf/Makefile.perf
> 
> between commit:
> 
>   552636b9317c8 ("perf trace: Add beautifier script for fsmount flags")
> 
> from the origin tree and commits:
> 
>   32969ef6e3e19 ("perf build: Pre-generate BPF skeleton tooling during umbrella prepare phase")
>   537609924c437 ("perf trace beauty: Make beauty generated C code standalone .o files")
> 
> from the perf tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

I'm fixing this up, the patch below isn't enough, what Ian provided +
the following make it build for me, I'm testing this all and will push
perf-tools-next merged with torvalds/master soon.

- Arnaldo

⬢ [acme@toolbx perf-tools-next]$ git diff
diff --cc tools/perf/builtin-trace.c
index 0730c1d9f0b3adc7,48615ddccd93a1e8..0000000000000000
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@@ -783,11 -771,10 +783,6 @@@ static const char *bpf_cmd[] =
  };
  static DEFINE_STRARRAY(bpf_cmd, "BPF_");

- static const char *fsmount_flags[] = {
-       [1] = "CLOEXEC",
- };
- static DEFINE_STRARRAY(fsmount_flags, "FSMOUNT_");
 -#include "trace/beauty/generated/fsconfig_arrays.c"
 -
 -static DEFINE_STRARRAY(fsconfig_cmds, "FSCONFIG_");
--
  static const char *epoll_ctl_ops[] = { "ADD", "DEL", "MOD", };
  static DEFINE_STRARRAY_OFFSET(epoll_ctl_ops, "EPOLL_CTL_", 1);

⬢ [acme@toolbx perf-tools-next]$

 
> diff --cc tools/perf/Makefile.perf
> index 76b35ac19acbf,fc92d6ceac5b0..0000000000000
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@@ -508,232 -509,7 +508,6 @@@ arm64-sysreg-defs-clean
>   	$(Q)$(MAKE) -C $(arm64_gen_sysreg_dir) O=$(arm64_gen_sysreg_outdir) \
>   		prefix= subdir= clean > /dev/null
>   
> - beauty_linux_dir := $(srctree)/tools/perf/trace/beauty/include/linux/
> - beauty_uapi_linux_dir := $(srctree)/tools/perf/trace/beauty/include/uapi/linux/
> - beauty_uapi_sound_dir := $(srctree)/tools/perf/trace/beauty/include/uapi/sound/
> - beauty_arch_asm_dir := $(srctree)/tools/perf/trace/beauty/arch/x86/include/asm/
> - beauty_x86_arch_asm_uapi_dir := $(srctree)/tools/perf/trace/beauty/arch/x86/include/uapi/asm/
> - 
> - linux_uapi_dir := $(srctree)/tools/include/uapi/linux
> - asm_generic_uapi_dir := $(srctree)/tools/include/uapi/asm-generic
> - arch_asm_uapi_dir := $(srctree)/tools/arch/$(SRCARCH)/include/uapi/asm/
> - x86_arch_asm_dir := $(srctree)/tools/arch/x86/include/asm/
> - 
> - beauty_outdir := $(OUTPUT)trace/beauty/generated
> - beauty_ioctl_outdir := $(beauty_outdir)/ioctl
> - 
> - # Create output directory if not already present
> - $(shell [ -d '$(beauty_ioctl_outdir)' ] || mkdir -p '$(beauty_ioctl_outdir)')
> - 
> - syscall_array := $(beauty_outdir)/syscalltbl.c
> - syscall_tbl := $(srctree)/tools/perf/trace/beauty/syscalltbl.sh
> - syscall_tbl_data := $(srctree)/tools/scripts/syscall.tbl \
> - 	$(wildcard $(srctree)/tools/perf/arch/*/entry/syscalls/syscall*.tbl)
> - 
> - $(syscall_array): $(syscall_tbl) $(syscall_tbl_data)
> - 	$(Q)$(SHELL) '$(syscall_tbl)' $(srctree)/tools $@
> - 
> - fs_at_flags_array := $(beauty_outdir)/fs_at_flags_array.c
> - fs_at_flags_tbl := $(srctree)/tools/perf/trace/beauty/fs_at_flags.sh
> - 
> - $(fs_at_flags_array): $(beauty_uapi_linux_dir)/fcntl.h $(fs_at_flags_tbl)
> - 	$(Q)$(SHELL) '$(fs_at_flags_tbl)' $(beauty_uapi_linux_dir) > $@
> - 
> - clone_flags_array := $(beauty_outdir)/clone_flags_array.c
> - clone_flags_tbl := $(srctree)/tools/perf/trace/beauty/clone.sh
> - 
> - $(clone_flags_array): $(beauty_uapi_linux_dir)/sched.h $(clone_flags_tbl)
> - 	$(Q)$(SHELL) '$(clone_flags_tbl)' $(beauty_uapi_linux_dir) > $@
> - 
> - drm_ioctl_array := $(beauty_ioctl_outdir)/drm_ioctl_array.c
> - drm_hdr_dir := $(srctree)/tools/perf/trace/beauty/include/uapi/drm
> - drm_ioctl_tbl := $(srctree)/tools/perf/trace/beauty/drm_ioctl.sh
> - 
> - $(drm_ioctl_array): $(drm_hdr_dir)/drm.h $(drm_hdr_dir)/i915_drm.h $(drm_ioctl_tbl)
> - 	$(Q)$(SHELL) '$(drm_ioctl_tbl)' $(drm_hdr_dir) > $@
> - 
> - fadvise_advice_array := $(beauty_outdir)/fadvise_advice_array.c
> - fadvise_advice_tbl := $(srctree)/tools/perf/trace/beauty/fadvise.sh
> - 
> - $(fadvise_advice_array): $(beauty_uapi_linux_dir)/fadvise.h $(fadvise_advice_tbl)
> - 	$(Q)$(SHELL) '$(fadvise_advice_tbl)' $(beauty_uapi_linux_dir) > $@
> - 
> - fsmount_arrays := $(beauty_outdir)/fsmount_arrays.c
> - fsmount_tbls := $(srctree)/tools/perf/trace/beauty/fsmount.sh
> - 
> - $(fsmount_arrays): $(beauty_uapi_linux_dir)/mount.h $(fsmount_tbls)
> - 	$(Q)$(SHELL) '$(fsmount_tbls)' $(beauty_uapi_linux_dir) > $@
> - 
> - fsmount_attr_arrays := $(beauty_outdir)/fsmount_attr_arrays.c
> - fsmount_attr_tbls := $(srctree)/tools/perf/trace/beauty/fsmount_attr.sh
> - 
> - $(fsmount_attr_arrays): $(beauty_uapi_linux_dir)/mount.h $(fsmount_attr_tbls)
> - 	$(Q)$(SHELL) '$(fsmount_attr_tbls)' $(beauty_uapi_linux_dir) > $@
> - 
> - fspick_arrays := $(beauty_outdir)/fspick_arrays.c
> - fspick_tbls := $(srctree)/tools/perf/trace/beauty/fspick.sh
> - 
> - $(fspick_arrays): $(beauty_uapi_linux_dir)/mount.h $(fspick_tbls)
> - 	$(Q)$(SHELL) '$(fspick_tbls)' $(beauty_uapi_linux_dir) > $@
> - 
> - fsconfig_arrays := $(beauty_outdir)/fsconfig_arrays.c
> - fsconfig_tbls := $(srctree)/tools/perf/trace/beauty/fsconfig.sh
> - 
> - $(fsconfig_arrays): $(beauty_uapi_linux_dir)/mount.h $(fsconfig_tbls)
> - 	$(Q)$(SHELL) '$(fsconfig_tbls)' $(beauty_uapi_linux_dir) > $@
> - 
> - pkey_alloc_access_rights_array := $(beauty_outdir)/pkey_alloc_access_rights_array.c
> - asm_generic_hdr_dir := $(srctree)/tools/include/uapi/asm-generic/
> - pkey_alloc_access_rights_tbl := $(srctree)/tools/perf/trace/beauty/pkey_alloc_access_rights.sh
> - 
> - $(pkey_alloc_access_rights_array): $(asm_generic_hdr_dir)/mman-common.h $(pkey_alloc_access_rights_tbl)
> - 	$(Q)$(SHELL) '$(pkey_alloc_access_rights_tbl)' $(asm_generic_hdr_dir) > $@
> - 
> - sndrv_ctl_ioctl_array := $(beauty_ioctl_outdir)/sndrv_ctl_ioctl_array.c
> - sndrv_ctl_hdr_dir := $(srctree)/tools/include/uapi/sound
> - sndrv_ctl_ioctl_tbl := $(srctree)/tools/perf/trace/beauty/sndrv_ctl_ioctl.sh
> - 
> - $(sndrv_ctl_ioctl_array): $(beauty_uapi_sound_dir)/asound.h $(sndrv_ctl_ioctl_tbl)
> - 	$(Q)$(SHELL) '$(sndrv_ctl_ioctl_tbl)' $(beauty_uapi_sound_dir) > $@
> - 
> - sndrv_pcm_ioctl_array := $(beauty_ioctl_outdir)/sndrv_pcm_ioctl_array.c
> - sndrv_pcm_hdr_dir := $(srctree)/tools/include/uapi/sound
> - sndrv_pcm_ioctl_tbl := $(srctree)/tools/perf/trace/beauty/sndrv_pcm_ioctl.sh
> - 
> - $(sndrv_pcm_ioctl_array): $(beauty_uapi_sound_dir)/asound.h $(sndrv_pcm_ioctl_tbl)
> - 	$(Q)$(SHELL) '$(sndrv_pcm_ioctl_tbl)' $(beauty_uapi_sound_dir) > $@
> - 
> - kcmp_type_array := $(beauty_outdir)/kcmp_type_array.c
> - kcmp_hdr_dir := $(srctree)/tools/include/uapi/linux/
> - kcmp_type_tbl := $(srctree)/tools/perf/trace/beauty/kcmp_type.sh
> - 
> - $(kcmp_type_array): $(kcmp_hdr_dir)/kcmp.h $(kcmp_type_tbl)
> - 	$(Q)$(SHELL) '$(kcmp_type_tbl)' $(kcmp_hdr_dir) > $@
> - 
> - kvm_ioctl_array := $(beauty_ioctl_outdir)/kvm_ioctl_array.c
> - kvm_hdr_dir := $(srctree)/tools/include/uapi/linux
> - kvm_ioctl_tbl := $(srctree)/tools/perf/trace/beauty/kvm_ioctl.sh
> - 
> - $(kvm_ioctl_array): $(kvm_hdr_dir)/kvm.h $(kvm_ioctl_tbl)
> - 	$(Q)$(SHELL) '$(kvm_ioctl_tbl)' $(kvm_hdr_dir) > $@
> - 
> - socket_arrays := $(beauty_outdir)/socket.c
> - socket_tbl := $(srctree)/tools/perf/trace/beauty/socket.sh
> - 
> - $(socket_arrays): $(linux_uapi_dir)/in.h $(beauty_linux_dir)/socket.h $(socket_tbl)
> - 	$(Q)$(SHELL) '$(socket_tbl)' $(linux_uapi_dir) $(beauty_linux_dir) > $@
> - 
> - sockaddr_arrays := $(beauty_outdir)/sockaddr.c
> - sockaddr_tbl := $(srctree)/tools/perf/trace/beauty/sockaddr.sh
> - 
> - $(sockaddr_arrays): $(beauty_linux_dir)/socket.h $(sockaddr_tbl)
> - 	$(Q)$(SHELL) '$(sockaddr_tbl)' $(beauty_linux_dir) > $@
> - 
> - vhost_virtio_ioctl_array := $(beauty_ioctl_outdir)/vhost_virtio_ioctl_array.c
> - vhost_virtio_ioctl_tbl := $(srctree)/tools/perf/trace/beauty/vhost_virtio_ioctl.sh
> - 
> - $(vhost_virtio_ioctl_array): $(beauty_uapi_linux_dir)/vhost.h $(vhost_virtio_ioctl_tbl)
> - 	$(Q)$(SHELL) '$(vhost_virtio_ioctl_tbl)' $(beauty_uapi_linux_dir) > $@
> - 
> - perf_ioctl_array := $(beauty_ioctl_outdir)/perf_ioctl_array.c
> - perf_hdr_dir := $(srctree)/tools/include/uapi/linux
> - perf_ioctl_tbl := $(srctree)/tools/perf/trace/beauty/perf_ioctl.sh
> - 
> - $(perf_ioctl_array): $(perf_hdr_dir)/perf_event.h $(perf_ioctl_tbl)
> - 	$(Q)$(SHELL) '$(perf_ioctl_tbl)' $(perf_hdr_dir) > $@
> - 
> - madvise_behavior_array := $(beauty_outdir)/madvise_behavior_array.c
> - madvise_hdr_dir := $(srctree)/tools/include/uapi/asm-generic/
> - madvise_behavior_tbl := $(srctree)/tools/perf/trace/beauty/madvise_behavior.sh
> - 
> - $(madvise_behavior_array): $(madvise_hdr_dir)/mman-common.h $(madvise_behavior_tbl)
> - 	$(Q)$(SHELL) '$(madvise_behavior_tbl)' $(madvise_hdr_dir) > $@
> - 
> - mmap_flags_array := $(beauty_outdir)/mmap_flags_array.c
> - mmap_flags_tbl := $(srctree)/tools/perf/trace/beauty/mmap_flags.sh
> - 
> - $(mmap_flags_array): $(linux_uapi_dir)/mman.h $(asm_generic_uapi_dir)/mman.h $(asm_generic_uapi_dir)/mman-common.h $(mmap_flags_tbl)
> - 	$(Q)$(SHELL) '$(mmap_flags_tbl)' $(linux_uapi_dir) $(asm_generic_uapi_dir) $(arch_asm_uapi_dir) > $@
> - 
> - mremap_flags_array := $(beauty_outdir)/mremap_flags_array.c
> - mremap_flags_tbl := $(srctree)/tools/perf/trace/beauty/mremap_flags.sh
> - 
> - $(mremap_flags_array): $(linux_uapi_dir)/mman.h $(mremap_flags_tbl)
> - 	$(Q)$(SHELL) '$(mremap_flags_tbl)' $(linux_uapi_dir) > $@
> - 
> - mount_flags_array := $(beauty_outdir)/mount_flags_array.c
> - mount_flags_tbl := $(srctree)/tools/perf/trace/beauty/mount_flags.sh
> - 
> - $(mount_flags_array): $(beauty_uapi_linux_dir)/mount.h $(mount_flags_tbl)
> - 	$(Q)$(SHELL) '$(mount_flags_tbl)' $(beauty_uapi_linux_dir) > $@
> - 
> - move_mount_flags_array := $(beauty_outdir)/move_mount_flags_array.c
> - move_mount_flags_tbl := $(srctree)/tools/perf/trace/beauty/move_mount_flags.sh
> - 
> - $(move_mount_flags_array): $(beauty_uapi_linux_dir)/mount.h $(move_mount_flags_tbl)
> - 	$(Q)$(SHELL) '$(move_mount_flags_tbl)' $(beauty_uapi_linux_dir) > $@
> - 
> - mmap_prot_array := $(beauty_outdir)/mmap_prot_array.c
> - mmap_prot_tbl := $(srctree)/tools/perf/trace/beauty/mmap_prot.sh
> - 
> - $(mmap_prot_array): $(asm_generic_uapi_dir)/mman.h $(asm_generic_uapi_dir)/mman-common.h $(mmap_prot_tbl)
> - 	$(Q)$(SHELL) '$(mmap_prot_tbl)' $(asm_generic_uapi_dir) $(arch_asm_uapi_dir) > $@
> - 
> - prctl_option_array := $(beauty_outdir)/prctl_option_array.c
> - prctl_option_tbl := $(srctree)/tools/perf/trace/beauty/prctl_option.sh
> - 
> - $(prctl_option_array): $(beauty_uapi_linux_dir)/prctl.h $(prctl_option_tbl)
> - 	$(Q)$(SHELL) '$(prctl_option_tbl)' $(beauty_uapi_linux_dir) > $@
> - 
> - usbdevfs_ioctl_array := $(beauty_ioctl_outdir)/usbdevfs_ioctl_array.c
> - usbdevfs_ioctl_tbl := $(srctree)/tools/perf/trace/beauty/usbdevfs_ioctl.sh
> - 
> - $(usbdevfs_ioctl_array): $(beauty_uapi_linux_dir)/usbdevice_fs.h $(usbdevfs_ioctl_tbl)
> - 	$(Q)$(SHELL) '$(usbdevfs_ioctl_tbl)' $(beauty_uapi_linux_dir) > $@
> - 
> - x86_arch_prctl_code_array := $(beauty_outdir)/x86_arch_prctl_code_array.c
> - x86_arch_prctl_code_tbl := $(srctree)/tools/perf/trace/beauty/x86_arch_prctl.sh
> - 
> - $(x86_arch_prctl_code_array): $(beauty_x86_arch_asm_uapi_dir)/prctl.h $(x86_arch_prctl_code_tbl)
> - 	$(Q)$(SHELL) '$(x86_arch_prctl_code_tbl)' $(beauty_x86_arch_asm_uapi_dir) > $@
> - 
> - x86_arch_irq_vectors_array := $(beauty_outdir)/x86_arch_irq_vectors_array.c
> - x86_arch_irq_vectors_tbl := $(srctree)/tools/perf/trace/beauty/tracepoints/x86_irq_vectors.sh
> - 
> - $(x86_arch_irq_vectors_array): $(beauty_arch_asm_dir)/irq_vectors.h $(x86_arch_irq_vectors_tbl)
> - 	$(Q)$(SHELL) '$(x86_arch_irq_vectors_tbl)' $(beauty_arch_asm_dir) > $@
> - 
> - x86_arch_MSRs_array := $(beauty_outdir)/x86_arch_MSRs_array.c
> - x86_arch_MSRs_tbl := $(srctree)/tools/perf/trace/beauty/tracepoints/x86_msr.sh
> - 
> - $(x86_arch_MSRs_array): $(x86_arch_asm_dir)/msr-index.h $(x86_arch_MSRs_tbl)
> - 	$(Q)$(SHELL) '$(x86_arch_MSRs_tbl)' $(x86_arch_asm_dir) > $@
> - 
> - rename_flags_array := $(beauty_outdir)/rename_flags_array.c
> - rename_flags_tbl := $(srctree)/tools/perf/trace/beauty/rename_flags.sh
> - 
> - $(rename_flags_array): $(beauty_uapi_linux_dir)/fs.h $(rename_flags_tbl)
> - 	$(Q)$(SHELL) '$(rename_flags_tbl)' $(beauty_uapi_linux_dir) > $@
> - 
> - arch_errno_name_array := $(beauty_outdir)/arch_errno_name_array.c
> - arch_errno_hdr_dir := $(srctree)/tools
> - arch_errno_tbl := $(srctree)/tools/perf/trace/beauty/arch_errno_names.sh
> - 
> - $(arch_errno_name_array): $(arch_errno_tbl)
> - 	$(Q)$(SHELL) '$(arch_errno_tbl)' '$(patsubst -%,,$(CC))' $(arch_errno_hdr_dir) > $@
> - 
> - statx_mask_array := $(beauty_outdir)/statx_mask_array.c
> - statx_mask_tbl := $(srctree)/tools/perf/trace/beauty/statx_mask.sh
> - 
> - $(statx_mask_array): $(beauty_uapi_linux_dir)/stat.h $(statx_mask_tbl)
> - 	$(Q)$(SHELL) '$(statx_mask_tbl)' $(beauty_uapi_linux_dir) > $@
> - 
> - sync_file_range_arrays := $(beauty_outdir)/sync_file_range_arrays.c
> - sync_file_range_tbls := $(srctree)/tools/perf/trace/beauty/sync_file_range.sh
> - 
> - $(sync_file_range_arrays): $(beauty_uapi_linux_dir)/fs.h $(sync_file_range_tbls)
> - 	$(Q)$(SHELL) '$(sync_file_range_tbls)' $(beauty_uapi_linux_dir) > $@
> --
>   TESTS_CORESIGHT_DIR := $(srctree)/tools/perf/tests/shell/coresight
>   
>   tests-coresight-targets: FORCE


