Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332A3367F48
	for <linux-next@vger.kernel.org>; Tue, 14 Jul 2026 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033205; cv=none; b=KEI93YLMyAo3arwncwILm6cfRnnnBEuxefqsGUAr5qDFtpDct0bp5jVOYj41utG65rZE2XZnw0PNBWepzjgW1HyGzhgp4FhPxq3EMcBJzBUv/24rwYST5hDTGZvM5ypSVp5rDaeJmzQCVbepbeukVzWvt+GmNvSlY98LxEUE5Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033205; c=relaxed/simple;
	bh=l4VDYPv2eftCkajhT4ymvyoGbkQl02mCS4d+8vExgt0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kTovV0d5ibbos/cg5CcrNWlbsXhJpxJOBy5N7H1KYMRS7mOlNRCj6AATUWhu/dybMuhV1ChTWkJFKBaBhjPgqkBkrnTCxMnPwCvoEQsO7/3xS8L5mqZrZcKZajW0meaYU7CW2N1aSMKReuikWH3qiNG76lTfS/l9gLPuzDOMNeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tA9ypMFN; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tA9ypMFN"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-493c526df6bso8413545e9.3
        for <linux-next@vger.kernel.org>; Tue, 14 Jul 2026 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784033202; x=1784638002; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1SHJbUD8IaxJVL7qfZNGaFVLDDH/WHiVcz841meGoo=;
        b=tA9ypMFNl4M0K29GMUhwygmwbWp8cGYz8D93GPk3ddhjCsVpHDs6cWqgS7HaSnNAPT
         SyDllE8B65/nq/phlwy/MjB+4Rl2Xdz/wa7eyxBkoQEUIZpuDy6I6entyaCQ3wKvenwH
         2xQb4MaPeizvSySecav3JwGJ58JqGUwS48iPfvqMnCDxuhgjG/2d3CkEAlFvZdwhyj+a
         3RbZAT/CyBkkTZOv3B+PhEkExCMb7sROE3SPKSe2vX63E7/j+z4sUJqg4cVmGIseqp7F
         u4vw9PchJQ/fe7Egkx/mcSMOfFeMMVXZIrrZX4DQnaCKLdattmFL1oe1OZuXlIRq0Gh/
         F14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784033202; x=1784638002;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1SHJbUD8IaxJVL7qfZNGaFVLDDH/WHiVcz841meGoo=;
        b=kE75r0jcpdm8UrMlMvbbelIY9vwMowb7XOD7Ivt7Y+chFEbXxD4sB5MpmY+aX2GJp9
         cGjAaVhvrOdiiV79EAf6CysrycRFt+oiNDRvOmEmANfMKAFdWpm83WduSVcAAAqyIp8n
         MQOMN9Bjf5tPPo6Ye+Khtfc4nH4YFwJPX45kLTNuhrRz8Irulxx0r100WUAm1qS6Oilg
         DdGExtbuVmNoW5HPXraxfQnjzePmKqyTPLychuOKvrCbMHhTsec553dTEm6zuNWb0w8V
         wGGMNcWLA7Bjk0tp94Vh+0U+/3xFLVWo7oQsBHzaVbdJkMd6901d4EBH6W66alcpmiKS
         w/tg==
X-Forwarded-Encrypted: i=1; AHgh+RrgFQIvhQ00WLs9t9CCVY4xqlGZ01ZT1hwx9FP+vIyFQq1Ww+EJsv1lEqcLwNiBwKzpm7EFXk+1wi0c@vger.kernel.org
X-Gm-Message-State: AOJu0YwTJeMhhUQEvYrXViahAdUjKxB2t5Gi8QDAYmZuQJ6nYyLsbN6i
	MrUzIKOT0dqUdY2BsMKT2UPhsC/xgYo3blliUQg24+Xt0iOTYIC17pPiQCcM7utw9yCY3m8DLxB
	g9TT92ja+/CSy7rMB9A==
X-Received: from wmej2.prod.google.com ([2002:a05:600c:42c2:b0:483:6e28:c16f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ed1:b0:494:ca0f:b7e9 with SMTP id 5b1f17b1804b1-494ca0fb80dmr53706885e9.10.1784033201930;
 Tue, 14 Jul 2026 05:46:41 -0700 (PDT)
Date: Tue, 14 Jul 2026 12:46:41 +0000
In-Reply-To: <alTxRkflyqvAaGc-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <alTxRkflyqvAaGc-@sirena.org.uk>
Message-ID: <alYvsW4eRWsA46YU@google.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the origin tree
From: Alice Ryhl <aliceryhl@google.com>
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Keshav Verma <iganschel@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"

On Mon, Jul 13, 2026 at 03:08:06PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got conflicts in:
> 
>   drivers/android/binder/node.rs
>   drivers/android/binder/process.rs
> 
> between commits:
> 
>   6849cabfd30fb ("rust_binder: reject context manager self-transaction")
>   bc4a982889787 ("rust_binder: clear freeze listener on node removal")
> 
> from the origin tree and commits:
> 
>   b9d17aa74ddd7 ("rust_binder: avoid allocating under node_refs for freeze listeners")
>   521eae8326a18 ("rust_binder: avoid dropping NodeRef in update_ref() under lock")
> 
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> I am really not at all confident in this merge.

Thanks for giving it a shot! I have a slightly different resolution
since some lines added by commit bc4a98288978 ("rust_binder: clear
freeze listener on node removal") need to be kept.

Please see below for the diff between my resolution and yours.

Alice



$ git diff linux-next/master drivers/android/binder
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index c5f745c85a02..0555c4bd503e 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -954,6 +954,8 @@ pub(crate) fn update_ref(
         // increment references on itself.
         let _to_free_by_handle;
         let _to_free_by_node;
+        let _to_free_freeze_listener;
+        let _to_free_freeze_listener_cleanup;
         let mut refs = self.node_refs.lock();
         if let Some(info) = refs.by_handle.get_mut(&handle) {
             if info.node_ref().update(inc, strong) {
@@ -971,6 +973,14 @@ pub(crate) fn update_ref(
                 unsafe { info.node_ref2().node.remove_node_info(info) };
 
                 let id = info.node_ref().node.global_id();
+
+                if let Some(freeze) = *info.freeze() {
+                    if let Some(fl) = refs.freeze_listeners.remove(&freeze) {
+                        _to_free_freeze_listener_cleanup = fl.on_process_cleanup(&self);
+                        _to_free_freeze_listener = fl;
+                    }
+                }
+
                 _to_free_by_handle = refs.by_handle.remove_node(&handle);
                 _to_free_by_node = refs.by_node.remove_node(&id);
                 refs.handle_is_present.release_id(handle as usize);

