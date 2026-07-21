Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030B23BB13A
	for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 08:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622489; cv=none; b=ca+dxGVr6GeUO/nkqLus7oS0r9VmVLiaRz80toRBpvJB7/ecKvOSFjp/pFzv5EF4BNdj7682WLCFubschwRPbs1p/tCCOyhrSv/WExlmJnYMMrZ3D0Do2K03xTn/dZ2y9V/nYeWiZpfTHP497vrEpBflG5sU6Oj1sja3sUrOHDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622489; c=relaxed/simple;
	bh=aVwFCfjug6v0YMLQCQrPWF+ub4F4PacKG/H1vVP0GRU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RrCtDph0oKEQxbr82SpeBqKkwG1DTE2lZym0VJD8kgi3McuWxnrRv58O2Q7Ap99BFY+YXRtLC8y/SGvDNpM09zAdD4QwcL/XHWVxPQLP43xhM5Tv9GKz3jvTST9wFAaLMiACB3SCuPn4CrtkgKlEmDGHDlRl628NHg8fTyFqsvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=epU8EbuS; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="epU8EbuS"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47f810c8aebso199649f8f.2
        for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 01:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784622486; x=1785227286; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=51dWd0aEDtrjal+0qBQ6E+UL9ljUkI8QsdqMhhO3wf8=;
        b=epU8EbuSMNVwatnXNKdDXzWYF79nUBEX/8M39Lhdo14J1SLmuZe2hHbKytXAm/thlQ
         ih/a6/d84ZK+evYF8At6aUXZpu3kzOOUZBYwTLcuuZQWaR+BxikW6L4crdmbdIZImQFs
         lNVNXqHAqYzBzQ8Q3X8aPTStPqyqMzrItPtbQcbpWXG6+0ObWPoCQNsVqDWdIRggdHgA
         0SMRidQgnuCUBonCIU+T32fl9NJscrKe7IteAQg/tsWIzAn4nripSkZsHKQJNLU5LNYK
         4K0dhnCx2uIJ/x+Kzb/tejOXklub1E2A0msKLkMV2s/2jX6uJMPMynB1zkN7ZRixDtD7
         BPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622486; x=1785227286;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=51dWd0aEDtrjal+0qBQ6E+UL9ljUkI8QsdqMhhO3wf8=;
        b=d7hLmMFgoj6qJg4c6wb8rdBK8SZrkI/B2ZG/Uas9bOiWyKRVNU7FxDokrROPG7Wiuf
         x9uyIi11ytN7e2VKVLDGDplKlyK+mjtQ6EvNghwJPawAwLMpu5mdSZ4zeLiNp3UsGOqE
         o0kDEUENl994c+BO9eT9Sceyy4zng301gzkvn/8oTaOhVxELu7X1wfwFrSSEElOsoOBJ
         yR9HIncleOnXlADAKzooi6pT3wbFoamgKO8f7KJpduHMpSD5IgpXkbBYARgRcPBi2Fsq
         VdVpnZBaxq4A9eXJ9+YKD5YRfwjwQC9VbDWepmWu+Z6uuaDcXxq1yk9DW2JI1v9gJuPq
         ihBg==
X-Forwarded-Encrypted: i=1; AHgh+RpGRyhEDppQk3c8lKfSsXGXsLtl7yPriFhB8cudyIbXsGAc+g5JiV5nfs5mGWyvF4AGeGnZA4/TSIgd@vger.kernel.org
X-Gm-Message-State: AOJu0YxkttyGfr2Py+PUDKAkMwqR9rwk7hZ6Ud6rzcBmQCJhJjB/YtsT
	aX3mnLgHk5mbiSXzDNWnzoGE2NqmJU4JPJM+TtWUBZGYEU2PTrxU9bdw931wU2OnCg2/8r4k91D
	9fZ3RsqkVNzSjeWv76Q==
X-Received: from wmbea10.prod.google.com ([2002:a05:600c:674a:b0:495:5b59:7a9c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5887:b0:493:b56b:c45c with SMTP id 5b1f17b1804b1-4954a40d424mr136459235e9.30.1784622485977;
 Tue, 21 Jul 2026 01:28:05 -0700 (PDT)
Date: Tue, 21 Jul 2026 08:28:05 +0000
In-Reply-To: <al40WiyRukYGQ68S@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <al40WiyRukYGQ68S@sirena.org.uk>
Message-ID: <al8tlTE4KgeZ92PQ@google.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
From: Alice Ryhl <aliceryhl@google.com>
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jahnavi MN <jahnavimn@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"

On Mon, Jul 20, 2026 at 03:44:42PM +0100, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the char-misc tree got a conflict in:
>
>   drivers/android/binder/thread.rs
>
> between commit:
>
>   bb66b1a345253 ("rust_binder: only print failure if error has source")
>
> from the char-misc.current tree and commit:
>
>   c61f3ad2213cf ("rust_binder: Implement BINDER_DEBUG_FAILED_TRANSACTION")
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
> diff --cc drivers/android/binder/thread.rs
> index bc0ef8927905c,a51821dde0adf..0000000000000
> --- a/drivers/android/binder/thread.rs
> +++ b/drivers/android/binder/thread.rs
> @@@ -1273,14 -1295,25 +1295,24 @@@ impl Thread
>                           inner.extended_error =
>                               ExtendedError::new(info.debug_id as u32, err.reply, source.to_errno());
>                       }
>  -                }
>
> -                     pr_warn!(
> -                         "{}:{} transaction to {} failed: {err:?}",
> -                         info.from_pid,
> -                         info.from_tid,
> -                         info.to_pid
>  -                binder_debug!(
>  -                    FailedTransaction,
>  -                    "transaction {} to {}:{} failed {:?}, code {} size {}-{}",
>  -                    if info.is_reply {
>  -                        "reply"
>  -                    } else if info.is_oneway() {
>  -                        "async"
>  -                    } else {
>  -                        "call"
>  -                    },
>  -                    info.to_pid,
>  -                    info.to_tid,
>  -                    err,
>  -                    info.code,
>  -                    info.data_size,
>  -                    info.offsets_size
>  -                );
> ++                    binder_debug!(
> ++                        FailedTransaction,
> ++                        "transaction {} to {}:{} failed {:?}, code {} size {}-{}",
> ++                        if info.is_reply {
> ++                            "reply"
> ++                        } else if info.is_oneway() {
> ++                            "async"
> ++                        } else {
> ++                            "call"
> ++                        },
> ++                        info.to_pid,
> ++                        info.to_tid,
> ++                        err,
> ++                        info.code,
> ++                        info.data_size,
> ++                        info.offsets_size
>  +                    );
> -                 }
>               }
>           }

I think you're missing a closing } after the binder_debug! call.
Otherwise LGTM.

error: this file contains an unclosed delimiter
    --> drivers/android/binder/thread.rs:1743:3
     |
453  | impl Thread {
     |             - unclosed delimiter
...
1290 |                 if let Some(source) = &err.source {
     |                                                   - this delimiter might not be properly closed...
...
1316 |             }
     |             - ...as it matches this but it has different indentation
...
1743 | }
     |  ^

error: aborting due to 1 previous error

Alice
