Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD28533260C;
	Thu, 21 May 2026 14:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375324; cv=none; b=ACrXYWxZwGg7mK9jpF3aXhBLAG/HKl4sbc08ksvjOruSuP8K4tmZTkiQ+0ok3Cjtqw8E8J6NTxmEKDPiLJm/y3ssyHDPZEyayuDD36BQJ2BWf+GZ7p56UK3wEBLyRB5DexEhXbJMLHuaLR84+EK1iiPAQvAU7pB3+9iaRckFfOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375324; c=relaxed/simple;
	bh=g8Lyo6x76kg8HHagMdSYv1c1HeeQ5lAuOD7gqoXqB44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LHQzfUBntSnK1F1xTqPGJgOud2/KfPdTcMLnwHVoDP2rqDDyqDXYr+0O/4woX6mELXOUYvN4pwbnFPz6YCxWbL8JQzE6TxSj7C/tKtCvIPpBJBurEBKyzXqerd2m2CPSy3T/Hl1XABfgfB6trMaunXXzm0ILHnhmxVgyggvjKZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=JpefkF9i; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="JpefkF9i"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4gLs071Tq7z8FRh;
	Thu, 21 May 2026 16:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1779375319;
	bh=g8Lyo6x76kg8HHagMdSYv1c1HeeQ5lAuOD7gqoXqB44=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JpefkF9icUTKd2DGYu0mDhyevjydWO2GgaNRFAdLdynIu1yPec+pFv9G+T4Z+8q2D
	 UFqEyup8GdPPFukDhzw6ve9kcZoawq6q5rYdGYtpdWTtajhjQtfqQIFgklbco9yTAH
	 yUFtAgeHdQmUPWVCu+KKhbpfH/O46ei9SN1DMfM1KIvbvCDySo417LLWUoKWruVNTN
	 MM9I6FWxzvTbXgGStMTPXdbgSodl7HphlaCBt3xdA3P6VA0f59ga5NMRLqt3Qwgqxa
	 aFX8Lwe1xY7wXPIm7ucCTwqftc8UZZ6iQwR2N5kKcumRSEfEofxOJOP1njZX6GK34p
	 GvClGBhn9ZRCw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4gLs070mPmz8FRb;
	Thu, 21 May 2026 16:55:19 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gLs064G26z8svF;
	Thu, 21 May 2026 16:55:18 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 82A635FBF7;
	Thu, 21 May 2026 16:55:17 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=linux@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <31bfcd67-40b7-4dc2-aa88-a4839347f005@leemhuis.info>
Date: Thu, 21 May 2026 16:55:16 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the perf tree with the origin tree
To: Mark Brown <broonie@kernel.org>,
 Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 Ian Rogers <irogers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <ag7cF9XqINQyrq6f@sirena.org.uk>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <ag7cF9XqINQyrq6f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177937531791.1872996.8201125793692550875@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 82A635FBF7
X-NC-CID: FRM44ogwpzfrQBSP3U8KKiHWdvxS49M3lLPDoSUJVk/nbShAUtg=

On 5/21/26 12:19, Mark Brown wrote:
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

Wonder if something went wrong here, as I ran into a build problem with
perf today:

"""
> trace/beauty/fsmount.c: In function ‘fsmount__scnprintf_attr_flags’:
> trace/beauty/fsmount.c:37:10: fatal error: trace/beauty/generated/fsmount_attr_arrays.c: No such file or directory
>    37 | #include "trace/beauty/generated/fsmount_attr_arrays.c"
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[4]: *** [/builddir/build/BUILD/kernel-7.1.0-build/kernel-next-20260521/linux-7.1.0-0.0.next.20260521.432.vanilla.fc45.x86_64/tools/build/Makefile.build:95: trace/beauty/fsmount.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
"""

Full log:
https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/fedora-rawhide-x86_64/10492250-next-next-all/builder-live.log.gz

Seems Intel's kernel test robot had a similar exprience that was
bisected to "[7390/7547] Merge branch 'perf-tools-next'" (with a "low
confidence bisect report"):
https://lore.kernel.org/all/202605211515.bBZSRAkp-lkp@intel.com/

Ciao, Thorsten

> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
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

