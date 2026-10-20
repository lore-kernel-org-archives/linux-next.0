Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792519477;
	b=LCn47Da9YkNgdfVtiDt28iLYD1RefBAF++vhk8Yt0XIRXJ/+6GjW9/j3HUPCClO3JNR/
	 T0GJsOZj3byjRFHf+hdofPqx/e103fScAAP1XOdPyYGaHp0XHp7hViVqLRdExq7T5hD/j
	 q9o2dvXs0RzV/QOzM2iY9i1V83hagtsp/QVOFxYuOLMk4O1IeSZTGUQI+U/tH8tBXD28p
	 TVWkVY8QeoYxdJUU5pPkYPjnVJKHlGsOLCOBmlZv6zzh9UAXRtkzJ0vGrEbtCS4oHw54k
	 egxLfWZ1JWgeAhy/T8GO2jxTLapUs2mfrwuWPcuv00JPa1SWsiKGc2ShIRXGpSfDs7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SkOSxYOcLHPXGNYa7jA4h5BWgn2pB/uT8aTkA+ryHZw=;
	b=ptjf7pGZo74dxL162xMw+0cR5BOrx7THIgNw6mWurxJmPNis4PU6P52qcn6Eagi8T+Ii
	 ItQlDNehSpvc9KBOdcY5jXfszQJgQEY8O9GWqO53lTwc37hjszzI0KzhjNww3By+UILKN
	 ZB3WCZhqw6Wrx3bJOxmYgrDECjahxIwezvqmjr5gW2+hKdFKY62OWC1nLG9WxdXQbVAYl
	 xKGUs53MA2Hi1DQpxP0G7w/RVBTeCzzly1t9GilvByF6eLXHNkNVKda0H7w0NclR+BFXu
	 l9ljuLDqOLMJhXdoo/Hzjkxjzk+DkIxGd5PRPfqw2o/2SYMzZPxCPXBBMzeTqGXsHrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ej6hAinx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4475606A31A
	for <linux-next@vger.kernel.org>; Tue, 20 Oct 2026 18:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4475606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ej6hAinx
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-34c522572bfso370191eec.3
        for <linux-next@vger.kernel.org>; Tue, 20 Oct 2026 11:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792519476; cv=none;
        d=google.com; s=arc-20260327;
        b=BHJTo6KDT2XGWKP1koE6dN9EYZjLRl5tnvcUtdp1G3d8itdHq0W45MBx2FnxmDtC0Q
         Rx4U6Mx+iQLbZv5Vf1Y4meugwBFiTBpcjtF4tSqKHm61r1G+zwMd1TTqrclJ7PdKJbB/
         5T1eEyVhk+TDYLFr2ZFmRCBqGPUTab7ozWmdHs7jaL2VtsLZBIeviJOHpdgr5bR1Lwd4
         bUyMaJZEBDp6fUYIueIvZLadfHly5G2Xi0/gm6s3ok2t1LMW6RRGz3KL9Nvqca1tWSru
         yMKXRbgUKftNaqzfqzGrcaDXjQSYjvUdhi4GBv4MCf0Tiia2lqEp5m+vc48SQKQIGuYT
         eE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SkOSxYOcLHPXGNYa7jA4h5BWgn2pB/uT8aTkA+ryHZw=;
        fh=9pKukPRrjtfwvU6WLS+05y5hE3APSx+GMsxo0DhwlC8=;
        b=gAimXHQdHNKAnLf7GksJODHZI9OI76DsZi6So/61ZkfpantdRumc6+Z9n92tFYdHTj
         qMAar5Ohmds/TH8xJ0A7aLMIm/Mi5qHDgw9R/51KN+AgzdFlL16JAxJq8YAoNnQyRgGl
         8vEDZweEpEvwpQHQ0IcYFqz+HlkgjEr+/yTHu8KmgIItHqw9VGjI6G0oykwjtoMPVI6M
         JDu5bQ1WcVnN8nPxk2nbB+jRjo4SJYSNoN0pUZCf4vOI8uDneXDrI7LjOV9kinjAsHkV
         XIZKQqiDS839EMH6VVOlsDL7n2OGHL6jAfKdrx+nPf9zPbfvvurzU8NGskzanhsj2ZFv
         u+wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792519476; x=1793124276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SkOSxYOcLHPXGNYa7jA4h5BWgn2pB/uT8aTkA+ryHZw=;
        b=ej6hAinxfCnGBlLhraj2kIFUbg+MSlyvMke4duznBwZ8W3fpjYEJ0At6qpWQ8ewsqk
         A2dwgfA0/V3EHRo3fMyb/1P3bgRcM0LAW8+xN+iur2L1w1zKzRVwg1omL36fgqWHyCzN
         gRsR5Z6rHqJ6yD6sKbT5h1CrbnhFgRT+49DAEu3w293A03roUXbrgx2WLUgH4P68Gwva
         wpHC+VzjuZSxb/y6EmH97P4QrKvN3/65uLDN5In4sJJUbE6mwpk2FPibr95/Z6jLKYmw
         RVxvRNZuUbPnabwaazLy2ZFqlyDIGzAtu/Glms5k09dFLMtkKFGFjjEuTQGoE8dgzE5v
         fbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519476; x=1793124276;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkOSxYOcLHPXGNYa7jA4h5BWgn2pB/uT8aTkA+ryHZw=;
        b=z2rfiYDP+Y7MzrkGcnJZvjzrEiAIB3IGeBQ4By5Yf0fCKLh9t6QevEGZvt3iZxwK5I
         xasodFZ+Hk1fz03Kd+eCQkNP8++lf9eofMpPYonx+vQjZQajdIy97+qYCnl6xHh1Fng7
         J3EEamjcOowlVlKxXTu15rJA5pPliEFvIzFHgwTeTNfJlm4wXZJUg2FjiU3fv+KSzVaK
         g6dk4RgO4l11ydaKBjdN/kNyPc3HY5F3DyREBql72CBVTXdXt66oVMRB5q2hkxSXEU/A
         HzWHvT/5voKVcCc4j7BtOXxTNDxasCV6EHWXynhvkNow5n7RY63D9QwB8oJvMK8XfIXV
         TQpg==
X-Forwarded-Encrypted: i=1; AKwUvBxeDKeCbhCG2U3v21HKPrSDqNHwLwTD5WIllrsnVGp2MXCr7wh5TlwMpz/BJlLlnFb1yH/Z4F2xlNZC@vger.kernel.org
X-Gm-Message-State: AFq9FYLyyXEDq3vNr9Y73qBIh7dzj21O8oqiTEvxKi61sYCFDnGP2lu0
	Jfx8MsuXAIeO+JUjRLib1syl+imBvWWHQT/xR64dZJhY+HwMvM1/fNSib+CCfFcezhi8e6OmJzB
	KFBpTjLHiZvxhyy8ly17EFXB1SHxqspQ=
X-Gm-Gg: AYBFou0gj77fq4LwPba/t+2mINUW7ejmuiYE7Y9lwvCkx/e5xFkyaYR0CSZSltHdeM/
	J96EjEfN9z9K68XaskVplqtHlfBZ0/+2jFVkPHSCNDFqyve8ltAJdkL1LyIyCVwLg+DCfL07/Tu
	7ZXeJ943HmO4ORZlrBcbZLB+DrtgWDLhKnbaiy5AlCCYNAVjrwEf4BbUZlNnBJu/k99rcMaJ2n8
	8JqS8sePwXvMtX4Vpa4AZvuAi8BczVynqlu6DIvaOEG2ziomxV2KWm0HmIs98GTSyRKsfyW2Z5+
	E5ywnZFhOc6YNJkkFb1gtfoGIm5Aj+V8ZKRnsp1eKQ/rz5kBUrArp+FrdxneeYYGK4/AhFENHJy
	re2+qq0ViTQNfptsWzGA502C01w8iCVQEGVu7+h7t9mw3nCEfMRAqwLElsYcL5Ox8xWjuIXImQ0
	zcKWDvxn0uwEp0k1H5wd+N+6sWUIl4FzmFUORgr2EO/D2EaOs5a1Y=
X-Received: by 2002:a05:693c:638e:20b0:351:6d7f:e2bc with SMTP id
 5a478bee46e88-3674db5603dmr18223eec.2.1792519475702; Tue, 20 Oct 2026
 11:04:35 -0700 (PDT)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atdeNvRKFuQd2qHz@sirena.co.uk>
In-Reply-To: <atdeNvRKFuQd2qHz@sirena.co.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 20:04:21 +0200
X-Gm-Features: AclHuK8uicpeOQVDa7YyBrby-50eUveLy_yF6eUllgv4q-wP0heOlGOe9JdcgNk
Message-ID: <CANiq72nsZ3u8XfFGRL5nN9jvsMekrB-Rziy-N-XxKg7KAcap3g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the rust tree
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Alice Ryhl <aliceryhl@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 2:27=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Today's linux-next merge of the char-misc tree got a conflict in:
>
>   drivers/android/binder/thread.rs
>
> between commit:
>
>   a12f22b2c9398 ("rust_binder: use pr_*_ratelimited! for printing")
>
> from the rust tree and commit:
>
>   985955d8e6b2b ("rust_binder: wake epoll on self-work queued to poll thr=
ead")
>
> from the char-misc tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks fine, thanks!

Cheers,
Miguel
