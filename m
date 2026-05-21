Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85354277CA5
	for <linux-next@vger.kernel.org>; Thu, 21 May 2026 15:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375867; cv=pass; b=lr1EOf3qnthVz7pjm2CZQGo2hWvZcbzXMwBooeO2Y+CvbvdGgXXUy7n6y+ryYpPw7gx2uhkYQZMnke4Q5g//r/p4DTBQjTII9aBw64pNodUUlCM+P38S6lSO+DcMW7YZG93kyjoA+E2Bgdz0acRzZRqx50fpB44iHEZKp0WaEd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375867; c=relaxed/simple;
	bh=PzNUrp/nz0MynGWi7IhECyXRCT5wqSLndvG1ebchFJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PAO1KpIfncrW4k8evaWJUKiUhcfX+SqjxdHUS1KTO34UTHw51ML4P4NhwdFuyJDWqrbdnMiFVBQfR7yQG3XlvtiX9SjUzpxSn+RJXo9fADwJ+IC37xgVUbRhWWDwYTKF1utf/QPrk83pn3aQehqnFQNE5thxhLzXGvACEQGYQdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PG7v79nG; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PG7v79nG"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so1285ad.0
        for <linux-next@vger.kernel.org>; Thu, 21 May 2026 08:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779375865; cv=none;
        d=google.com; s=arc-20240605;
        b=kh15L5boKNVD6+iHpiLqfPwaxXwk2Ivea+eNg5n4VJGDcJ2mwS065abLoBP7Z/o7E5
         kql0qWnLvi92BSAcZpgGE3Nlfsfi/oq7wl76b/Nk0LUFpXpFMMIqAuXjlov2xrhH8ly8
         VR9eL4k+qM8A3m+zaIlbNgd8m5woT5FdRc7+iT2gC+xJ+5mhusTJEo4vWQYIuohQp9jC
         ZToEdMvItrShs+S64LO/Gz9a2FFCZAmP824rcMohsg5bUZUeuaxgyzHbS/HauPxclp2Z
         jF+BJknsF4+ZoVaCvPtsL6f1Ueip0GCp8aNj50J5t0KEf0CqA/nsBYWgmALwUd5ajHiX
         9bmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ySLDzyqES0WgG6v+N/OpXsD5HkQs3DmScuGiMLrcPE=;
        fh=0+/pGBVZ2A+HLN8UtEmVivBpt7y+95Iq0UQhXep6PLA=;
        b=E1t91ZDQrxPdbtG5qB/GIhV0Qe9iPkzIKq44nqJJ/t6vmFn23K0ZGtCu2jm9fUzdnf
         rjb4/fq7pOsPNVI+3KVDayLOwtK9lq+QOCO+gJI89TzQdOxn92giwTgWAB2iHQat/EYt
         7O77l8OOhHmnM2KhVzFhUTygHhVbHCOtff1AangPH20CvB4wlGbaow5NNjZQXUISgO1P
         Ibj0E7YZUeNqAHdA5gl/Vlk00X9IL3E4Ktq14IRXapuqIh2QMheRY05UleFvAo4g6oFx
         Q5uk9JyqKxO/b/zrF4ZUSiGVbcV/5fvCIwsy2t4gi57pAIyRbacVcpQcIvFk9FnoTFqp
         3AuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779375865; x=1779980665; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ySLDzyqES0WgG6v+N/OpXsD5HkQs3DmScuGiMLrcPE=;
        b=PG7v79nGczDqRslcq95NVq5HNqOVJ+Xt3sUmNqtNMDpR9m2jNM2Bq72BZcoGksES2O
         PHullzMI5VwC3QbPXCSzuXbc1jk5CRAA9+E6Eax15USlpFTK/AZNF5+QlCj/kGcLvLQE
         jHnhw5T2kWbWFH2hBybq3vjCZ2TH6N2GBao7yYHryWB0pW1qOr98sIrw4Qn55R/6Jvso
         TVTU3mGykhw10yimQKueTYB4AkjBs8+9WfYGLuvlnaKIfkc7pcpN/hh5TcZK4ix1cYxt
         vUxX8KJKD5eSdJhHjbOtf8P/j8SeKyRJp0SHXyIJnimkMHfxhcRlTDKKiwcQWOqqjnxy
         zEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375865; x=1779980665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ySLDzyqES0WgG6v+N/OpXsD5HkQs3DmScuGiMLrcPE=;
        b=k64g2tkfTkDVR3HxjPD4qBw7tQQC+oRYfsMwoB3cRQ3coyhOhCcaSJC37M8PJKbli1
         pVIq9qwUvTTBwdpZZY6JJzDIyckfqZFNXl8BzLZth5H2uSFEX+hC231bDPNEiFxJpGMm
         rQEOn6xahID5hP9a9BxhkV2Q19Ai0Bz93jvNpCVYVyM1TSVZ2d+V/ZPNHQR3zpMKxTkH
         6OYacHfHLjK8Kl0ZEdrSvtiFMsbDNc3ElVSrTpYzuxkQ2eQgiJjkObESLjU7VYyglocs
         BIsSi7liFDRIfAdrO7Rh5TWfyxO0fIHUYEIkZmIgnpzQjvxJUdDI/1hre52fah0hkps7
         xuPg==
X-Forwarded-Encrypted: i=1; AFNElJ9+sFVhqScaUBtnRFeS4J1m/iCiPEfitVFz3OFF5rXlNNNU81nHq1ykdAQMW8sq5SnEE+6IF4JHy8pL@vger.kernel.org
X-Gm-Message-State: AOJu0YxTdHJ/dsimWmznRiX9L+4yEXl7lhRgbY3/D33r9CE0ZRlNzMop
	miUb00hkWE1CGeUIDd56DYnCczh2QaKano9kZcMGoj60LTNa7zhMNNGWunWigeubT7y3H4ySDLx
	bzI/YSNz9z9Wlv7Y0syGn46NuvVrWVJsMqE/jURlz
X-Gm-Gg: Acq92OHUMJtLuVFXuDvss1QZac4RlQluu1LxV37yw8h01ptKUhqwmsr+n8eLVRH+/ZD
	7RFOGVSU2Ya8VRT/S3r6+kUC1AY7AFIrY4rTIBicUGG0lHdCwETxMuQY+9lgxmt6JM1up42I5DU
	OUCipKBEx1x8CzcMBOC7k+uLvYs9BPnAqtwHFinu3zgV7PoA4DnR2NJz5l3UvjsJXdltMx68R0b
	bxYNFOmix6xIFnpv6PEyB/MvfwmrLWJDja9kXcjesxCzQ7pUCpwCmE69/1ov9FvvWrizfCv0dZP
	kPvFFf2eGQRqoSVCkVIXg6INWx3Fn4fGnNczq9TnuoI2W7ckXDACK0Q9giE=
X-Received: by 2002:a17:903:41d2:b0:2bc:dc0b:ab29 with SMTP id
 d9443c01a7336-2bea1f5a7bfmr2647995ad.0.1779375863921; Thu, 21 May 2026
 08:04:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ag7cF9XqINQyrq6f@sirena.org.uk> <31bfcd67-40b7-4dc2-aa88-a4839347f005@leemhuis.info>
In-Reply-To: <31bfcd67-40b7-4dc2-aa88-a4839347f005@leemhuis.info>
From: Ian Rogers <irogers@google.com>
Date: Thu, 21 May 2026 08:04:11 -0700
X-Gm-Features: AVHnY4INdMHINeUDoQ1OBzmDAJgcSTW1A84syRxhQFzK8TG_JV1h0Jducw-wB7A
Message-ID: <CAP-5=fVH=fETWYO=VKuA+aC6=qjyqEmku6JeJhB=q=Nns+rMEQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the perf tree with the origin tree
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Mark Brown <broonie@kernel.org>, Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, 
	Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 7:55=E2=80=AFAM Thorsten Leemhuis <linux@leemhuis.i=
nfo> wrote:
>
> On 5/21/26 12:19, Mark Brown wrote:
> >
> > Today's linux-next merge of the perf tree got a conflict in:
> >
> >   tools/perf/Makefile.perf
> >
> > between commit:
> >
> >   552636b9317c8 ("perf trace: Add beautifier script for fsmount flags")
> >
> > from the origin tree and commits:
> >
> >   32969ef6e3e19 ("perf build: Pre-generate BPF skeleton tooling during =
umbrella prepare phase")

I believe this commit has issues with "perf trace: Add beautifier
script for fsmount flags":
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools.git/com=
mit/?h=3Dperf-tools&id=3D552636b9317c8a843dd4496d77e56976ab48c76b
This change went to the perf-tools tree and then to linux/master,
while "perf build: Pre-generate BPF skeleton tooling during umbrella
prepare phase" has gone to perf-tools-next and then to linux-next.
I'll look into a fix.

Thanks,
Ian


> >   537609924c437 ("perf trace beauty: Make beauty generated C code stand=
alone .o files")
> >
> > from the perf tree.
>
> Wonder if something went wrong here, as I ran into a build problem with
> perf today:
>
> """
> > trace/beauty/fsmount.c: In function =E2=80=98fsmount__scnprintf_attr_fl=
ags=E2=80=99:
> > trace/beauty/fsmount.c:37:10: fatal error: trace/beauty/generated/fsmou=
nt_attr_arrays.c: No such file or directory
> >    37 | #include "trace/beauty/generated/fsmount_attr_arrays.c"
> >       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make[4]: *** [/builddir/build/BUILD/kernel-7.1.0-build/kernel-next-2026=
0521/linux-7.1.0-0.0.next.20260521.432.vanilla.fc45.x86_64/tools/build/Make=
file.build:95: trace/beauty/fsmount.o] Error 1
> > make[4]: *** Waiting for unfinished jobs....
> """
>
> Full log:
> https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/f=
edora-rawhide-x86_64/10492250-next-next-all/builder-live.log.gz
>
> Seems Intel's kernel test robot had a similar exprience that was
> bisected to "[7390/7547] Merge branch 'perf-tools-next'" (with a "low
> confidence bisect report"):
> https://lore.kernel.org/all/202605211515.bBZSRAkp-lkp@intel.com/
>
> Ciao, Thorsten
>
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tre=
e
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularl=
y
> > complex conflicts.
> >
> > diff --cc tools/perf/Makefile.perf
> > index 76b35ac19acbf,fc92d6ceac5b0..0000000000000
> > --- a/tools/perf/Makefile.perf
> > +++ b/tools/perf/Makefile.perf
> > @@@ -508,232 -509,7 +508,6 @@@ arm64-sysreg-defs-clean
> >       $(Q)$(MAKE) -C $(arm64_gen_sysreg_dir) O=3D$(arm64_gen_sysreg_out=
dir) \
> >               prefix=3D subdir=3D clean > /dev/null
> >
> > - beauty_linux_dir :=3D $(srctree)/tools/perf/trace/beauty/include/linu=
x/
> > - beauty_uapi_linux_dir :=3D $(srctree)/tools/perf/trace/beauty/include=
/uapi/linux/
> > - beauty_uapi_sound_dir :=3D $(srctree)/tools/perf/trace/beauty/include=
/uapi/sound/
> > - beauty_arch_asm_dir :=3D $(srctree)/tools/perf/trace/beauty/arch/x86/=
include/asm/
> > - beauty_x86_arch_asm_uapi_dir :=3D $(srctree)/tools/perf/trace/beauty/=
arch/x86/include/uapi/asm/
> > -
> > - linux_uapi_dir :=3D $(srctree)/tools/include/uapi/linux
> > - asm_generic_uapi_dir :=3D $(srctree)/tools/include/uapi/asm-generic
> > - arch_asm_uapi_dir :=3D $(srctree)/tools/arch/$(SRCARCH)/include/uapi/=
asm/
> > - x86_arch_asm_dir :=3D $(srctree)/tools/arch/x86/include/asm/
> > -
> > - beauty_outdir :=3D $(OUTPUT)trace/beauty/generated
> > - beauty_ioctl_outdir :=3D $(beauty_outdir)/ioctl
> > -
> > - # Create output directory if not already present
> > - $(shell [ -d '$(beauty_ioctl_outdir)' ] || mkdir -p '$(beauty_ioctl_o=
utdir)')
> > -
> > - syscall_array :=3D $(beauty_outdir)/syscalltbl.c
> > - syscall_tbl :=3D $(srctree)/tools/perf/trace/beauty/syscalltbl.sh
> > - syscall_tbl_data :=3D $(srctree)/tools/scripts/syscall.tbl \
> > -     $(wildcard $(srctree)/tools/perf/arch/*/entry/syscalls/syscall*.t=
bl)
> > -
> > - $(syscall_array): $(syscall_tbl) $(syscall_tbl_data)
> > -     $(Q)$(SHELL) '$(syscall_tbl)' $(srctree)/tools $@
> > -
> > - fs_at_flags_array :=3D $(beauty_outdir)/fs_at_flags_array.c
> > - fs_at_flags_tbl :=3D $(srctree)/tools/perf/trace/beauty/fs_at_flags.s=
h
> > -
> > - $(fs_at_flags_array): $(beauty_uapi_linux_dir)/fcntl.h $(fs_at_flags_=
tbl)
> > -     $(Q)$(SHELL) '$(fs_at_flags_tbl)' $(beauty_uapi_linux_dir) > $@
> > -
> > - clone_flags_array :=3D $(beauty_outdir)/clone_flags_array.c
> > - clone_flags_tbl :=3D $(srctree)/tools/perf/trace/beauty/clone.sh
> > -
> > - $(clone_flags_array): $(beauty_uapi_linux_dir)/sched.h $(clone_flags_=
tbl)
> > -     $(Q)$(SHELL) '$(clone_flags_tbl)' $(beauty_uapi_linux_dir) > $@
> > -
> > - drm_ioctl_array :=3D $(beauty_ioctl_outdir)/drm_ioctl_array.c
> > - drm_hdr_dir :=3D $(srctree)/tools/perf/trace/beauty/include/uapi/drm
> > - drm_ioctl_tbl :=3D $(srctree)/tools/perf/trace/beauty/drm_ioctl.sh
> > -
> > - $(drm_ioctl_array): $(drm_hdr_dir)/drm.h $(drm_hdr_dir)/i915_drm.h $(=
drm_ioctl_tbl)
> > -     $(Q)$(SHELL) '$(drm_ioctl_tbl)' $(drm_hdr_dir) > $@
> > -
> > - fadvise_advice_array :=3D $(beauty_outdir)/fadvise_advice_array.c
> > - fadvise_advice_tbl :=3D $(srctree)/tools/perf/trace/beauty/fadvise.sh
> > -
> > - $(fadvise_advice_array): $(beauty_uapi_linux_dir)/fadvise.h $(fadvise=
_advice_tbl)
> > -     $(Q)$(SHELL) '$(fadvise_advice_tbl)' $(beauty_uapi_linux_dir) > $=
@
> > -
> > - fsmount_arrays :=3D $(beauty_outdir)/fsmount_arrays.c
> > - fsmount_tbls :=3D $(srctree)/tools/perf/trace/beauty/fsmount.sh
> > -
> > - $(fsmount_arrays): $(beauty_uapi_linux_dir)/mount.h $(fsmount_tbls)
> > -     $(Q)$(SHELL) '$(fsmount_tbls)' $(beauty_uapi_linux_dir) > $@
> > -
> > - fsmount_attr_arrays :=3D $(beauty_outdir)/fsmount_attr_arrays.c
> > - fsmount_attr_tbls :=3D $(srctree)/tools/perf/trace/beauty/fsmount_att=
r.sh
> > -
> > - $(fsmount_attr_arrays): $(beauty_uapi_linux_dir)/mount.h $(fsmount_at=
tr_tbls)
> > -     $(Q)$(SHELL) '$(fsmount_attr_tbls)' $(beauty_uapi_linux_dir) > $@
> > -
> > - fspick_arrays :=3D $(beauty_outdir)/fspick_arrays.c
> > - fspick_tbls :=3D $(srctree)/tools/perf/trace/beauty/fspick.sh
> > -
> > - $(fspick_arrays): $(beauty_uapi_linux_dir)/mount.h $(fspick_tbls)
> > -     $(Q)$(SHELL) '$(fspick_tbls)' $(beauty_uapi_linux_dir) > $@
> > -
> > - fsconfig_arrays :=3D $(beauty_outdir)/fsconfig_arrays.c
> > - fsconfig_tbls :=3D $(srctree)/tools/perf/trace/beauty/fsconfig.sh
> > -
> > - $(fsconfig_arrays): $(beauty_uapi_linux_dir)/mount.h $(fsconfig_tbls)
> > -     $(Q)$(SHELL) '$(fsconfig_tbls)' $(beauty_uapi_linux_dir) > $@
> > -
> > - pkey_alloc_access_rights_array :=3D $(beauty_outdir)/pkey_alloc_acces=
s_rights_array.c
> > - asm_generic_hdr_dir :=3D $(srctree)/tools/include/uapi/asm-generic/
> > - pkey_alloc_access_rights_tbl :=3D $(srctree)/tools/perf/trace/beauty/=
pkey_alloc_access_rights.sh
> > -
> > - $(pkey_alloc_access_rights_array): $(asm_generic_hdr_dir)/mman-common=
.h $(pkey_alloc_access_rights_tbl)
> > -     $(Q)$(SHELL) '$(pkey_alloc_access_rights_tbl)' $(asm_generic_hdr_=
dir) > $@
> > -
> > - sndrv_ctl_ioctl_array :=3D $(beauty_ioctl_outdir)/sndrv_ctl_ioctl_arr=
ay.c
> > - sndrv_ctl_hdr_dir :=3D $(srctree)/tools/include/uapi/sound
> > - sndrv_ctl_ioctl_tbl :=3D $(srctree)/tools/perf/trace/beauty/sndrv_ctl=
_ioctl.sh
> > -
> > - $(sndrv_ctl_ioctl_array): $(beauty_uapi_sound_dir)/asound.h $(sndrv_c=
tl_ioctl_tbl)
> > -     $(Q)$(SHELL) '$(sndrv_ctl_ioctl_tbl)' $(beauty_uapi_sound_dir) > =
$@
> > -
> > - sndrv_pcm_ioctl_array :=3D $(beauty_ioctl_outdir)/sndrv_pcm_ioctl_arr=
ay.c
> > - sndrv_pcm_hdr_dir :=3D $(srctree)/tools/include/uapi/sound
> > - sndrv_pcm_ioctl_tbl :=3D $(srctree)/tools/perf/trace/beauty/sndrv_pcm=
_ioctl.sh
> > -
> > - $(sndrv_pcm_ioctl_array): $(beauty_uapi_sound_dir)/asound.h $(sndrv_p=
cm_ioctl_tbl)
> > -     $(Q)$(SHELL) '$(sndrv_pcm_ioctl_tbl)' $(beauty_uapi_sound_dir) > =
$@
> > -
> > - kcmp_type_array :=3D $(beauty_outdir)/kcmp_type_array.c
> > - kcmp_hdr_dir :=3D $(srctree)/tools/include/uapi/linux/
> > - kcmp_type_tbl :=3D $(srctree)/tools/perf/trace/beauty/kcmp_type.sh
> > -
> > - $(kcmp_type_array): $(kcmp_hdr_dir)/kcmp.h $(kcmp_type_tbl)
> > -     $(Q)$(SHELL) '$(kcmp_type_tbl)' $(kcmp_hdr_dir) > $@
> > -
> > - kvm_ioctl_array :=3D $(beauty_ioctl_outdir)/kvm_ioctl_array.c
> > - kvm_hdr_dir :=3D $(srctree)/tools/include/uapi/linux
> > - kvm_ioctl_tbl :=3D $(srctree)/tools/perf/trace/beauty/kvm_ioctl.sh
> > -
> > - $(kvm_ioctl_array): $(kvm_hdr_dir)/kvm.h $(kvm_ioctl_tbl)
> > -     $(Q)$(SHELL) '$(kvm_ioctl_tbl)' $(kvm_hdr_dir) > $@
> > -
> > - socket_arrays :=3D $(beauty_outdir)/socket.c
> > - socket_tbl :=3D $(srctree)/tools/perf/trace/beauty/socket.sh
> > -
> > - $(socket_arrays): $(linux_uapi_dir)/in.h $(beauty_linux_dir)/socket.h=
 $(socket_tbl)
> > -     $(Q)$(SHELL) '$(socket_tbl)' $(linux_uapi_dir) $(beauty_linux_dir=
) > $@
> > -
> > - sockaddr_arrays :=3D $(beauty_outdir)/sockaddr.c
> > - sockaddr_tbl :=3D $(srctree)/tools/perf/trace/beauty/sockaddr.sh
> > -
> > - $(sockaddr_arrays): $(beauty_linux_dir)/socket.h $(sockaddr_tbl)
> > -     $(Q)$(SHELL) '$(sockaddr_tbl)' $(beauty_linux_dir) > $@
> > -
> > - vhost_virtio_ioctl_array :=3D $(beauty_ioctl_outdir)/vhost_virtio_ioc=
tl_array.c
> > - vhost_virtio_ioctl_tbl :=3D $(srctree)/tools/perf/trace/beauty/vhost_=
virtio_ioctl.sh
> > -
> > - $(vhost_virtio_ioctl_array): $(beauty_uapi_linux_dir)/vhost.h $(vhost=
_virtio_ioctl_tbl)
> > -     $(Q)$(SHELL) '$(vhost_virtio_ioctl_tbl)' $(beauty_uapi_linux_dir)=
 > $@
> > -
> > - perf_ioctl_array :=3D $(beauty_ioctl_outdir)/perf_ioctl_array.c
> > - perf_hdr_dir :=3D $(srctree)/tools/include/uapi/linux
> > - perf_ioctl_tbl :=3D $(srctree)/tools/perf/trace/beauty/perf_ioctl.sh
> > -
> > - $(perf_ioctl_array): $(perf_hdr_dir)/perf_event.h $(perf_ioctl_tbl)
> > -     $(Q)$(SHELL) '$(perf_ioctl_tbl)' $(perf_hdr_dir) > $@
> > -
> > - madvise_behavior_array :=3D $(beauty_outdir)/madvise_behavior_array.c
> > - madvise_hdr_dir :=3D $(srctree)/tools/include/uapi/asm-generic/
> > - madvise_behavior_tbl :=3D $(srctree)/tools/perf/trace/beauty/madvise_=
behavior.sh
> > -
> > - $(madvise_behavior_array): $(madvise_hdr_dir)/mman-common.h $(madvise=
_behavior_tbl)
> > -     $(Q)$(SHELL) '$(madvise_behavior_tbl)' $(madvise_hdr_dir) > $@
> > -
> > - mmap_flags_array :=3D $(beauty_outdir)/mmap_flags_array.c
> > - mmap_flags_tbl :=3D $(srctree)/tools/perf/trace/beauty/mmap_flags.sh
> > -
> > - $(mmap_flags_array): $(linux_uapi_dir)/mman.h $(asm_generic_uapi_dir)=
/mman.h $(asm_generic_uapi_dir)/mman-common.h $(mmap_flags_tbl)
> > -     $(Q)$(SHELL) '$(mmap_flags_tbl)' $(linux_uapi_dir) $(asm_generic_=
uapi_dir) $(arch_asm_uapi_dir) > $@
> > -
> > - mremap_flags_array :=3D $(beauty_outdir)/mremap_flags_array.c
> > - mremap_flags_tbl :=3D $(srctree)/tools/perf/trace/beauty/mremap_flags=
.sh
> > -
> > - $(mremap_flags_array): $(linux_uapi_dir)/mman.h $(mremap_flags_tbl)
> > -     $(Q)$(SHELL) '$(mremap_flags_tbl)' $(linux_uapi_dir) > $@
> > -
> > - mount_flags_array :=3D $(beauty_outdir)/mount_flags_array.c
> > - mount_flags_tbl :=3D $(srctree)/tools/perf/trace/beauty/mount_flags.s=
h
> > -
> > - $(mount_flags_array): $(beauty_uapi_linux_dir)/mount.h $(mount_flags_=
tbl)
> > -     $(Q)$(SHELL) '$(mount_flags_tbl)' $(beauty_uapi_linux_dir) > $@
> > -
> > - move_mount_flags_array :=3D $(beauty_outdir)/move_mount_flags_array.c
> > - move_mount_flags_tbl :=3D $(srctree)/tools/perf/trace/beauty/move_mou=
nt_flags.sh
> > -
> > - $(move_mount_flags_array): $(beauty_uapi_linux_dir)/mount.h $(move_mo=
unt_flags_tbl)
> > -     $(Q)$(SHELL) '$(move_mount_flags_tbl)' $(beauty_uapi_linux_dir) >=
 $@
> > -
> > - mmap_prot_array :=3D $(beauty_outdir)/mmap_prot_array.c
> > - mmap_prot_tbl :=3D $(srctree)/tools/perf/trace/beauty/mmap_prot.sh
> > -
> > - $(mmap_prot_array): $(asm_generic_uapi_dir)/mman.h $(asm_generic_uapi=
_dir)/mman-common.h $(mmap_prot_tbl)
> > -     $(Q)$(SHELL) '$(mmap_prot_tbl)' $(asm_generic_uapi_dir) $(arch_as=
m_uapi_dir) > $@
> > -
> > - prctl_option_array :=3D $(beauty_outdir)/prctl_option_array.c
> > - prctl_option_tbl :=3D $(srctree)/tools/perf/trace/beauty/prctl_option=
.sh
> > -
> > - $(prctl_option_array): $(beauty_uapi_linux_dir)/prctl.h $(prctl_optio=
n_tbl)
> > -     $(Q)$(SHELL) '$(prctl_option_tbl)' $(beauty_uapi_linux_dir) > $@
> > -
> > - usbdevfs_ioctl_array :=3D $(beauty_ioctl_outdir)/usbdevfs_ioctl_array=
.c
> > - usbdevfs_ioctl_tbl :=3D $(srctree)/tools/perf/trace/beauty/usbdevfs_i=
octl.sh
> > -
> > - $(usbdevfs_ioctl_array): $(beauty_uapi_linux_dir)/usbdevice_fs.h $(us=
bdevfs_ioctl_tbl)
> > -     $(Q)$(SHELL) '$(usbdevfs_ioctl_tbl)' $(beauty_uapi_linux_dir) > $=
@
> > -
> > - x86_arch_prctl_code_array :=3D $(beauty_outdir)/x86_arch_prctl_code_a=
rray.c
> > - x86_arch_prctl_code_tbl :=3D $(srctree)/tools/perf/trace/beauty/x86_a=
rch_prctl.sh
> > -
> > - $(x86_arch_prctl_code_array): $(beauty_x86_arch_asm_uapi_dir)/prctl.h=
 $(x86_arch_prctl_code_tbl)
> > -     $(Q)$(SHELL) '$(x86_arch_prctl_code_tbl)' $(beauty_x86_arch_asm_u=
api_dir) > $@
> > -
> > - x86_arch_irq_vectors_array :=3D $(beauty_outdir)/x86_arch_irq_vectors=
_array.c
> > - x86_arch_irq_vectors_tbl :=3D $(srctree)/tools/perf/trace/beauty/trac=
epoints/x86_irq_vectors.sh
> > -
> > - $(x86_arch_irq_vectors_array): $(beauty_arch_asm_dir)/irq_vectors.h $=
(x86_arch_irq_vectors_tbl)
> > -     $(Q)$(SHELL) '$(x86_arch_irq_vectors_tbl)' $(beauty_arch_asm_dir)=
 > $@
> > -
> > - x86_arch_MSRs_array :=3D $(beauty_outdir)/x86_arch_MSRs_array.c
> > - x86_arch_MSRs_tbl :=3D $(srctree)/tools/perf/trace/beauty/tracepoints=
/x86_msr.sh
> > -
> > - $(x86_arch_MSRs_array): $(x86_arch_asm_dir)/msr-index.h $(x86_arch_MS=
Rs_tbl)
> > -     $(Q)$(SHELL) '$(x86_arch_MSRs_tbl)' $(x86_arch_asm_dir) > $@
> > -
> > - rename_flags_array :=3D $(beauty_outdir)/rename_flags_array.c
> > - rename_flags_tbl :=3D $(srctree)/tools/perf/trace/beauty/rename_flags=
.sh
> > -
> > - $(rename_flags_array): $(beauty_uapi_linux_dir)/fs.h $(rename_flags_t=
bl)
> > -     $(Q)$(SHELL) '$(rename_flags_tbl)' $(beauty_uapi_linux_dir) > $@
> > -
> > - arch_errno_name_array :=3D $(beauty_outdir)/arch_errno_name_array.c
> > - arch_errno_hdr_dir :=3D $(srctree)/tools
> > - arch_errno_tbl :=3D $(srctree)/tools/perf/trace/beauty/arch_errno_nam=
es.sh
> > -
> > - $(arch_errno_name_array): $(arch_errno_tbl)
> > -     $(Q)$(SHELL) '$(arch_errno_tbl)' '$(patsubst -%,,$(CC))' $(arch_e=
rrno_hdr_dir) > $@
> > -
> > - statx_mask_array :=3D $(beauty_outdir)/statx_mask_array.c
> > - statx_mask_tbl :=3D $(srctree)/tools/perf/trace/beauty/statx_mask.sh
> > -
> > - $(statx_mask_array): $(beauty_uapi_linux_dir)/stat.h $(statx_mask_tbl=
)
> > -     $(Q)$(SHELL) '$(statx_mask_tbl)' $(beauty_uapi_linux_dir) > $@
> > -
> > - sync_file_range_arrays :=3D $(beauty_outdir)/sync_file_range_arrays.c
> > - sync_file_range_tbls :=3D $(srctree)/tools/perf/trace/beauty/sync_fil=
e_range.sh
> > -
> > - $(sync_file_range_arrays): $(beauty_uapi_linux_dir)/fs.h $(sync_file_=
range_tbls)
> > -     $(Q)$(SHELL) '$(sync_file_range_tbls)' $(beauty_uapi_linux_dir) >=
 $@
> > --
> >   TESTS_CORESIGHT_DIR :=3D $(srctree)/tools/perf/tests/shell/coresight
> >
> >   tests-coresight-targets: FORCE
>
