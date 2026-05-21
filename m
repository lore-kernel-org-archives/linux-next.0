Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3988F383982;
	Thu, 21 May 2026 16:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779382320; cv=none; b=JUHs9RlTV/UHrt8fTJjjftnOwY11DBQEQQ6aMTIC1rrKVWb4wFd2EBReLasA+5yYPKt7X9Txyky7zwl3GrY+Bau621ux7S5qR1ztKa0HlBpZMxZFbiDFsvgATotpgcial8Cn/8HiKx0v+OB8C7gTyhfwH+ZDvmm+w0TtS5++ISM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779382320; c=relaxed/simple;
	bh=aru09wy/NBlHK39MOrW3TFHbTe2CCskP4B619hvsNQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIPsDlczcLKDrwDIxPPemT+gf4B69tx1+typIYPrC3dRrE+p0R64Ipz1HjH1UVofmukLAIAbEtMrm86Bb+g5WsXUS17kyF1aeYQxkuuqZrusMsJyiFgOSbpRycdwjLKAtnxF7hI5tCsjJlwG6Q+i+eXCmN6A4rdnDvEUN00ckkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhdp9KV8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhdp9KV8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B08001F000E9;
	Thu, 21 May 2026 16:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779382318;
	bh=XlcFYml6y/cN11PHcvv2x/qaYDQ1NUHgdkmUpV0feN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dhdp9KV8R9nwsD27W0R+pJz+DD5zwNxoQto6kZLHzllspclm6IlNuTAfwwZHvXOtB
	 cahNkiRpL12QOlwR1zEQFnBN6f7cMD8VHFzRi2bief9GKWfYROajspWeELoLmREqk1
	 fR0y6cBLLVMD2ZRpTUDBGAky69eAEySfp73yj0xSWU944yhXBMDMzV1WY4x136veoF
	 58cDfjm+FxWsU0ckF+WTy4x34R8Tdjni/E1T3+dAoFgUJYwc74PlLvN1FicZHK2JSe
	 xhbxsYLXNg42X5E8s8qsONiGHBvy7nWie+kZSuly+gQN8FiiFvtyrFbbbBg8IBgz3O
	 QlB0hCnXuGrmw==
Date: Thu, 21 May 2026 09:51:56 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: broonie@kernel.org, acme@redhat.com, arnaldo.melo@gmail.com,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	linux@leemhuis.info
Subject: Re: [PATCH v1] perf build: Fix fsmount.o build
Message-ID: <ag84LByEUcYydh-O@google.com>
References: <e08366fa-5fda-4534-8545-5d446734387f@sirena.org.uk>
 <20260521153558.1421014-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521153558.1421014-1-irogers@google.com>

Hi Ian,

On Thu, May 21, 2026 at 08:35:58AM -0700, Ian Rogers wrote:
> A merge conflict between:
> commit 552636b9317c8 ("perf trace: Add beautifier script for fsmount flags")
> commit 32969ef6e3e19 ("perf build: Pre-generate BPF skeleton tooling during umbrella prepare phase")
> Resulted in a missed build dependency in the merge:
> commit 61da860eee07 Merge branch 'perf-tools-next' of https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git
> 
> Fix the build by adding the necessary build dependencies.

Thanks for fixing this.  I believe the right fix would be to merge
perf-tools into perf-tools-next with this resolution.

Thanks,
Namhyung

> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/trace/beauty/Build | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/trace/beauty/Build b/tools/perf/trace/beauty/Build
> index 93cde93461a3..996e63cdf765 100644
> --- a/tools/perf/trace/beauty/Build
> +++ b/tools/perf/trace/beauty/Build
> @@ -111,6 +111,13 @@ $(fsmount_arrays): $(beauty_uapi_linux_dir)/mount.h $(fsmount_tbls)
>  	$(call rule_mkdir)
>  	$(Q)$(call echo-cmd,gen)$(SHELL) '$(fsmount_tbls)' $(beauty_uapi_linux_dir) > $@
>  
> +fsmount_attr_arrays := $(beauty_outdir)/fsmount_attr_arrays.c
> +fsmount_attr_tbls := $(srctree)/tools/perf/trace/beauty/fsmount_attr.sh
> +
> +$(fsmount_attr_arrays): $(beauty_uapi_linux_dir)/mount.h $(fsmount_attr_tbls)
> +	$(call rule_mkdir)
> +	$(Q)$(call echo-cmd,gen)$(SHELL) '$(fsmount_attr_tbls)' $(beauty_uapi_linux_dir) > $@
> +
>  fspick_arrays := $(beauty_outdir)/fspick_arrays.c
>  fspick_tbls := $(srctree)/tools/perf/trace/beauty/fspick.sh
>  
> @@ -285,7 +292,7 @@ $(OUTPUT)trace/beauty/syscalltbl.o: $(syscall_array)
>  $(OUTPUT)trace/beauty/fsconfig.o: $(fsconfig_arrays)
>  $(OUTPUT)trace/beauty/clone.o: $(clone_flags_array)
>  $(OUTPUT)trace/beauty/fs_at_flags.o: $(fs_at_flags_array)
> -$(OUTPUT)trace/beauty/fsmount.o: $(fsmount_arrays)
> +$(OUTPUT)trace/beauty/fsmount.o: $(fsmount_arrays) $(fsmount_attr_arrays)
>  $(OUTPUT)trace/beauty/fspick.o: $(fspick_arrays)
>  $(OUTPUT)trace/beauty/ioctl.o: $(drm_ioctl_array) $(sndrv_pcm_ioctl_array) $(sndrv_ctl_ioctl_array) $(kvm_ioctl_array) $(vhost_virtio_ioctl_array) $(perf_ioctl_array) $(usbdevfs_ioctl_array)
>  $(OUTPUT)trace/beauty/kcmp.o: $(kcmp_type_array)
> -- 
> 2.54.0.746.g67dd491aae-goog
> 
