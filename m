Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642FB368D6C
	for <linux-next@vger.kernel.org>; Thu, 21 May 2026 15:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377765; cv=none; b=kmMh9CkBOadoXG/qU3XGLZpjuLZEg1yRRx/GlKe7RTDPvp4RtEjPEQUwuWvLZLETB11bBNCVoO1SPS67FEulpckm2oJCqK+kjujhbeSXIiBxW/NEJc8kcTdIJ4+GxBRagnDQ3QFFhJeALfa4QdTEd3xZ0OrjzqFGt/W+ltH+EvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377765; c=relaxed/simple;
	bh=lizNbU7OWSW9NlsSvJz9oHLsQkWJ9gEWq/P+rFpk/LM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I53mpzrF1xDphN4Vv1HomkaCKvTVhFTxxdNXBasyIwAZ11PrKT5uK3sq60rBoE4up3CvetyZM6Khrv/4n5Yyt81egIP6QQAekaSx58mGrGAWd9dvv+GbzdJGto+brxLYM/6xml8QbyYarQRq1HiFQm5UzYxftgAzT5cTLFKjZfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J1WJR0nE; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J1WJR0nE"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-135f774f5e6so4317524c88.0
        for <linux-next@vger.kernel.org>; Thu, 21 May 2026 08:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779377763; x=1779982563; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F6lGaJSDIBqmMkdwp201XEsBA66WNIUlgHDJIOs3gpA=;
        b=J1WJR0nErBOSVQSzuEp2EIMCRlKvpsUeaCgL2P8rk9vV3kGDnNTUwHlEyUpuJOxnrt
         Bt6EoFt9NUhET5i4s3OrZjQSqCJJMDM5XU4NZsqQYEHMcvg+bayODOvnmWs9AN9ggvJt
         +EsVe32bPcQKg99FJqWPYKId0kXkcgHUT5j7eMxJEC9lpnLh5S9nYzGCUmdFir+R2TJ+
         8VnbO+AGv9nUmdWRlF19tqRZVphkYeZwnFKcc/1Fe8Je4QcKL/bxrCXRbIlQj0cNr546
         akLcu8PQpXfc3+KsGbj9UjMBxiaeBhbFPM3xDP2kfXFfC48RrNjPRels6UeiwW+FQu7n
         oaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377763; x=1779982563;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F6lGaJSDIBqmMkdwp201XEsBA66WNIUlgHDJIOs3gpA=;
        b=NUm1HsKJUMgo5Q1Gq3AF6Ft+97g+jBCmv+87eJVaaQKIv9+yoc0zjD+Pq//Sa1+Nnm
         aCUjelVPvkZmFhBQRWDe8m/suNWt8/plmH5EvN9xLXmntJ1S/0OSHNIaZ3i8iAfgMDQ5
         xMPI4asmE3xa9npljimMxXSIZhUKO10Aj/ZJwoaGPiWi0mxMSJpyV5z1zXyZgmrfmpna
         v9SI0ViuOcrwn4UI/N3vuJqC5uk66r8tREctEQyyXWzIjXTfWNaRql2IQSEV8hw6ccJI
         +YIi4+0rpjg09Ip0vOvZj5PpxMu4yJC/JFBZ5PyMHXZoVdBqeSyoKXySCReHYC1UmCJn
         AfLg==
X-Forwarded-Encrypted: i=1; AFNElJ9WXNBKaOpT3HBJHKkE/X2QA+rAPd6HFQjDnT3z0bH6l3E6YVyzLfPy3XBzF43SGgCIRvV5sJmCHCmT@vger.kernel.org
X-Gm-Message-State: AOJu0YzEULrv2O1AKYklr7sv1DU4I+qolMZwjKlkkk/Q4IpP6G6cA/fA
	2OjxwoXXF7eSTiQwXjDKPLvKl20lByNckzsJXSe+8r2LXieN0wJOvKVlB5KTI0IAMZlJ/g8xm/f
	4aiRE012dFw==
X-Received: from dly25-n1.prod.google.com ([2002:a05:701b:2059:10b0:135:e88b:8de6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:220c:b0:12c:8d32:9377
 with SMTP id a92af1059eb24-13632d3e850mr918113c88.29.1779377763325; Thu, 21
 May 2026 08:36:03 -0700 (PDT)
Date: Thu, 21 May 2026 08:35:58 -0700
In-Reply-To: <e08366fa-5fda-4534-8545-5d446734387f@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <e08366fa-5fda-4534-8545-5d446734387f@sirena.org.uk>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521153558.1421014-1-irogers@google.com>
Subject: [PATCH v1] perf build: Fix fsmount.o build
From: Ian Rogers <irogers@google.com>
To: broonie@kernel.org, acme@redhat.com, namhyung@kernel.org
Cc: arnaldo.melo@gmail.com, irogers@google.com, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, linux@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

A merge conflict between:
commit 552636b9317c8 ("perf trace: Add beautifier script for fsmount flags")
commit 32969ef6e3e19 ("perf build: Pre-generate BPF skeleton tooling during umbrella prepare phase")
Resulted in a missed build dependency in the merge:
commit 61da860eee07 Merge branch 'perf-tools-next' of https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git

Fix the build by adding the necessary build dependencies.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/trace/beauty/Build | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/perf/trace/beauty/Build b/tools/perf/trace/beauty/Build
index 93cde93461a3..996e63cdf765 100644
--- a/tools/perf/trace/beauty/Build
+++ b/tools/perf/trace/beauty/Build
@@ -111,6 +111,13 @@ $(fsmount_arrays): $(beauty_uapi_linux_dir)/mount.h $(fsmount_tbls)
 	$(call rule_mkdir)
 	$(Q)$(call echo-cmd,gen)$(SHELL) '$(fsmount_tbls)' $(beauty_uapi_linux_dir) > $@
 
+fsmount_attr_arrays := $(beauty_outdir)/fsmount_attr_arrays.c
+fsmount_attr_tbls := $(srctree)/tools/perf/trace/beauty/fsmount_attr.sh
+
+$(fsmount_attr_arrays): $(beauty_uapi_linux_dir)/mount.h $(fsmount_attr_tbls)
+	$(call rule_mkdir)
+	$(Q)$(call echo-cmd,gen)$(SHELL) '$(fsmount_attr_tbls)' $(beauty_uapi_linux_dir) > $@
+
 fspick_arrays := $(beauty_outdir)/fspick_arrays.c
 fspick_tbls := $(srctree)/tools/perf/trace/beauty/fspick.sh
 
@@ -285,7 +292,7 @@ $(OUTPUT)trace/beauty/syscalltbl.o: $(syscall_array)
 $(OUTPUT)trace/beauty/fsconfig.o: $(fsconfig_arrays)
 $(OUTPUT)trace/beauty/clone.o: $(clone_flags_array)
 $(OUTPUT)trace/beauty/fs_at_flags.o: $(fs_at_flags_array)
-$(OUTPUT)trace/beauty/fsmount.o: $(fsmount_arrays)
+$(OUTPUT)trace/beauty/fsmount.o: $(fsmount_arrays) $(fsmount_attr_arrays)
 $(OUTPUT)trace/beauty/fspick.o: $(fspick_arrays)
 $(OUTPUT)trace/beauty/ioctl.o: $(drm_ioctl_array) $(sndrv_pcm_ioctl_array) $(sndrv_ctl_ioctl_array) $(kvm_ioctl_array) $(vhost_virtio_ioctl_array) $(perf_ioctl_array) $(usbdevfs_ioctl_array)
 $(OUTPUT)trace/beauty/kcmp.o: $(kcmp_type_array)
-- 
2.54.0.746.g67dd491aae-goog

