Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0573C36896D
	for <linux-next@vger.kernel.org>; Sat, 22 Aug 2026 07:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787383415; cv=none; b=CnFAKfAr3FUSX4ZKrCkK8v4UCKQGRV47tGuMkgC3zub6CiFc/vE0h6rC1XVOAoAnkoq1iwWH19xvvJ4ICiBd2i7Mxn8A9LGOo4eKeceZ+YqvNzMZXpFthIX7I5zTWXfMtDSl9jyyfVvzCdciyST3k5msaWdnBfCHa5/EuCz9KCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787383415; c=relaxed/simple;
	bh=RWNYz384e4rKemzcuA5opb+syrbmhY7THbxYU3MsYLY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ocxKQCAMtZCyytNSRrX/y7SjGMJVmOMgC6+HRe9MAixXXzsdifwATXpRTpabXvhQ6iwdhfYsRjiiloy94PKcgsIrA0mwea92URny6bvyPRKjZMrUEmpaghKfdQ/AsQu6Ns8n7dClt+jU+ktQ8zwpm6wlr/2lHHXKK/6Xx/HgeY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktIK5t4/; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktIK5t4/"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15b1da6b82so189122166b.1
        for <linux-next@vger.kernel.org>; Sat, 22 Aug 2026 00:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787383412; x=1787988212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2FueEl+ZcII/8wuXmKky1Fcrh7O6MxQGPP0G/0IKJwg=;
        b=ktIK5t4/DBb6lCHQrH95SfNnoXE0Olq/qs9qjRKup8OaOL+VshSBaBGKEVWZC58tQf
         9PFPOtcRugZxLZC88HBhLaY/K0V+xw59svyhfsoqrd7duaTcBCUHkYdrxNDropwRzFij
         EH24+OYzA0j1qHuIehSNE1G7d61FwiWAINASe3POoCsV8V9mi7piXwAwJisUgaYfjDRc
         UOKLbhHAC3ifK8wEJrjAY9JH7ZyinnsWRcFFF5jR4LEeVvKs82QgGmEvdm82D4FptAJh
         MfxMtJQzspu+L7GX5AI4bbRgQdY0oiQ+5f4squBGerRIwKQWVytMSuajcTi27mA3ILTi
         qZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787383412; x=1787988212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2FueEl+ZcII/8wuXmKky1Fcrh7O6MxQGPP0G/0IKJwg=;
        b=dbownhTciUoG02NPOZYdZLKPdlI+0RLgz8cg4WBR/uT1P64LhPG753eHQHKKgCg4gp
         melo9KKIuWrUF7y0DAwH5E48JsXU4JtyRgqLrdiaQ7PLpCYIFOiS9SB2y1KbiX93jxAo
         e26PZSUO3pifcYMZGcQNmKyq8wjFGGmog7ol9XNuTJM3bVeTJNdXBpSCw/wL1v/rOAVD
         yUIuZ2OpHKD1mNORCHA3A6iqL1GfHvb6W8RLxQiO3a4gUXgFZKS8qVIe6rd1F9PYnVAH
         SSemu5g98a+SMUb6x41+u+eWc/uzxuJslDpAAPYFBJWyaHrWFm8ZCE3lh+hjb2qPRo1L
         Q8EQ==
X-Forwarded-Encrypted: i=1; AHgh+RrhQoX+oDeBFk7d7FU5sYUK4mXRF9iE2xZeRaVXtzLDLtmSR3LsgWevJ/HZ+NhIuo5mbWhTDj7EAgxV@vger.kernel.org
X-Gm-Message-State: AFuF++nOM2/mc9gFMuEx+swzQvPTSkFix1ay6sCRWTFFyUacGR15pVig
	x4BvxIVgQVATPzt/ICNXvDQ00THc0d/2Jhue+lgrSSpkT0EvCiwSwNE2
X-Gm-Gg: AR+sD12cPbWgYqWFAMzDH98mnz7bhm8U/6jvAc4DfoOEsImd45ENy8pMbjXuV2msLYR
	66cjujQp72ia2Ae/BAkgGVl/5csM9m3vjHCbKvgsRWAdKHkklG22HKhZ3SpJk5ouixyfBpKEeK1
	+fm2quj0SmMTaJd/lHc5rVxvQp34trbpknX6pKJ1P2uP5cNVtUF/3TRw7XXGRqFdWjSThaIS9ni
	dpZI5zzMOfIcM1uxDAEW4m0QYdYJ9R+VDXSohipUoVbUaPe/t/P5ShL7VIn3mJYw/XMsIGQQ+Zn
	1KrpdA3ybdm/9+OV4p2VAG746sTwMPxYnFh42tuPLK4giONvw4GO/PEXaX1f9NX5sFRMTDk2CSP
	J2kacJH8UVTmn1tdg1NEXetAHR0aku3T0Eijwhr1VTLVH8vbclPg8uUwJ3kO1R9oPnxW2lNorp4
	u2pso0VZPWFHicmhiawvZXMB8aNP2WpZBNJNyWidOGFJ0NlKGOknnHuwb6KXMHDpW99/TCRzBDV
	a4VfEYFXh/u201AzdGkmHotboti3gqJCGYrf3sMRZBT3Ptr+IkwwksI3zvigXdAYgmc22MQI7Rq
	5IgxO3DPQFZOupYHH6yhMcwOVZX+xX2LLsbsqHHKxeXcjgfD9TpLES+N6nk5ba93SzFNurfscA=
	=
X-Received: by 2002:a17:906:ba97:b0:c12:9b98:209e with SMTP id a640c23a62f3a-c246a692891mr1298531366b.23.1787383411862;
        Sat, 22 Aug 2026 00:23:31 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f6b48sm183689866b.33.2026.08.22.00.23.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 00:23:31 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Gregory Price <gourry@gourry.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: [PATCH v2] syscall_user_dispatch: Use CONFIG_SYSCTL for sysctl guard
Date: Sat, 22 Aug 2026 09:23:25 +0200
Message-Id: <20260822072325.51994-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260813062039.14567-1-kmehltretter@gmail.com>
References: <20260813062039.14567-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 8d75c338f0bc ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors
CONFIG_SYSCTL") removed CONFIG_PROC_SYSCTL, but the sysctl added by
commit 5b6e32ba7b59 ("syscall_user_dispatch: Add
kernel.syscall_user_dispatch sysctl") is still guarded by it. Now that
both commits are merged, kernel.syscall_user_dispatch is no longer
registered.

syscall_user_dispatch_allowed defaults to true. SUD therefore remains
available, but administrators cannot disable new activations.

Use CONFIG_SYSCTL for the guard and documentation.

Fixes: 5b6e32ba7b59 ("syscall_user_dispatch: Add kernel.syscall_user_dispatch sysctl")
Assisted-by: Codex:gpt-5.6-sol
Acked-by: Oleg Nesterov <oleg@redhat.com>
Reviewed-by: Joel Granados <joel.granados@kernel.org>
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v2:
  - Reword changelog and rebase onto mainline now that both commits
    are merged there (v7.2 is unaffected, it has neither commit).
  - Collected Acked-by/Reviewed-by tags from v1. No code change.

v1: https://lore.kernel.org/all/20260813062039.14567-1-kmehltretter@gmail.com/

 Documentation/admin-guide/sysctl/kernel.rst | 2 +-
 kernel/entry/syscall_user_dispatch.c        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index b6328cd0f43e..ffea61d448eb 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1416,7 +1416,7 @@ Controls whether userspace may arm Syscall User Dispatch via
   ==  ===================================================================
 
 Only present when the kernel is built with ``CONFIG_SYSCALL_USER_DISPATCH``
-and ``CONFIG_PROC_SYSCTL``.
+and ``CONFIG_SYSCTL``.
 
 
 sysctl_writes_strict
diff --git a/kernel/entry/syscall_user_dispatch.c b/kernel/entry/syscall_user_dispatch.c
index 2002c7aae435..59c861866941 100644
--- a/kernel/entry/syscall_user_dispatch.c
+++ b/kernel/entry/syscall_user_dispatch.c
@@ -178,7 +178,7 @@ int syscall_user_dispatch_set_config(struct task_struct *task, unsigned long siz
 					      (char __user *)(uintptr_t)cfg.selector);
 }
 
-#ifdef CONFIG_PROC_SYSCTL
+#ifdef CONFIG_SYSCTL
 static const struct ctl_table syscall_user_dispatch_sysctls[] = {
 	{
 		.procname	= "syscall_user_dispatch",
@@ -195,4 +195,4 @@ static int __init syscall_user_dispatch_sysctl_init(void)
 	return 0;
 }
 late_initcall(syscall_user_dispatch_sysctl_init);
-#endif /* CONFIG_PROC_SYSCTL */
+#endif /* CONFIG_SYSCTL */

base-commit: 26260251022fbc2f248a3d747a9b2b961b18d2d8
-- 
2.39.5 (Apple Git-154)

