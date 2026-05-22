Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4F93806AD
	for <linux-next@vger.kernel.org>; Fri, 22 May 2026 12:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452943; cv=pass; b=TN6XWsFRDhMsSE0lJaa5C68v24WBtSJ6C6LBd3xiYIV1l4iaLHH3QLkfIA8G7tMo1ZVorNZxjuTbD18LKVBGx1p/K1kitRhbtGjObq4G7o8LBEU1rdZehqrCsEn1SsM06beBaj89ZGrYZFQYAJWFyHbw2oJigQpUaGhVqYnrZuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452943; c=relaxed/simple;
	bh=JzztBwXgNLE95JBCEE+SOmfBqAQ6kZoLV8wY3R284XY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OiH/vf8YjVzvpgfN/RZtpSmEWoOZs2CVwuYCkIiLLsFSKZyXD6GObXHZl1yCB0E7q4O/8Yrk36tS+5xieXKGksYsoJPvcuEkEGBr8784piZpdfP8LS6QlvzND6/QuJAB3p52NgTuJcvCo61t/R2B/XMIDi4FYYXikkpwGllKD6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=IG7aiLsV; arc=pass smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="IG7aiLsV"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-914bb8e95c2so23525785a.1
        for <linux-next@vger.kernel.org>; Fri, 22 May 2026 05:29:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779452940; cv=none;
        d=google.com; s=arc-20240605;
        b=aaASozh3KlsJfkqpbN8jNFv0v8dU0BugyCtTvuKyFXbSq9o8c0P2C+VkkPh6lI5TVo
         qjZeOjZ8fWvs4yXa1z5gzY2zWaSkxmyGa7JViQm37tZVGl3uu0RzkxEXywUF8U0OpRJy
         d5KFrBL3Jb0Dx5PgxAfGIRWr5KlHuF/vm/Ryttn5yW+bB42v1j3859s/IfoKuTqg2Syo
         vnAxX2BMXXCfb8wcuHYI31MyVWJjAsUOnlmiDXRRr1iUXqJUCFWzO96SJ3v5JJPW54H9
         iffLN9K1stNVu2EHW0+gNfuK35fPoxHeLe7uyb0nk2oQ7w5Nm0DGQEGWn1rJ28v9Hnn5
         9wiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zA2xz+3aR0N7tLovn1Xl1J/sJuEXbHMmNCgpDAeWikQ=;
        fh=LlL2IXJikM+FMjWnFBu0Qwnaj1WTf7EfCxVMkC0Un7A=;
        b=SJ2W1PzJgHnGD4W4T5yOPh+cdeUsXsD47TGWpnTPCb/Unv/ppsWpIONf7M/RTmNrn2
         1gzSFVawNUehuiBPTPyeNQhBh1J/oPQPv2gZghhVp+3C4tJENgiNf3pT6i76+amOgSPM
         lcRTvOhinrn8Ygn00428ru3BlSeK5KWWb0OciUGQ6W03UPsT3axazovO6RRZFThuNVo2
         R4dd96Hbq+LRj8avobxEBKRe8X7CgkVD2fwXUQVVu4qPfP/3H19n3dXp4q0Q28fJCcM+
         9b5mllNKD5f4r02ZA3OhbSfQ3f4QFk6WkbzJ9h4kLV8doTr+b9Qgt6f8rq/SUBnvsT0z
         9TMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1779452940; x=1780057740; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zA2xz+3aR0N7tLovn1Xl1J/sJuEXbHMmNCgpDAeWikQ=;
        b=IG7aiLsVvow5Nh5NY6nbYo9cuVjxKIARoV2viJ4dKovTODW/EG4rYIdTtUL5i0mzwL
         RxeUVFyhvCFNteTwbCqSbW3WKTEF3/5n36Ff4kZTD7EOiYuXEAfmUZJKFR6Z0MzivpOG
         lJa2PDrQ1I9UIm0U0E4j8ioX3aA4/e8OND1Uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779452940; x=1780057740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zA2xz+3aR0N7tLovn1Xl1J/sJuEXbHMmNCgpDAeWikQ=;
        b=UoI2EJKjHBIcCcVH8xVNO457HMddXfFvUlmQoj7xuPcdhZyF9otIcvepxFc+U35Vlw
         qYlRPiSFI9Goyl8F8nGqEyuEeAEzsMor7+6EUJ24beyea7mAw6K2jQAXtRZHh4yr7Trv
         yUPARRLkevhWmC5ZaqqiEYXqTfLNku2+++s8H7v8W39ABbOVJaFHBz3A/xtf9930Gqhg
         ZkEZ/1n04szby/PK6vJJaLf4O9J5dxbshqjP3dvWfYItGB76OosR+f1qxdYxH9BDuLLX
         6hFERxzpQzJLmHM8eicn3kJ5vjYqufxX2i/yW2f4kbgfhToQIfaCEs0NmLIS9reIfqti
         hhLA==
X-Forwarded-Encrypted: i=1; AFNElJ+L9NVOTgnJiTiNLg1sQUpvBT3Y6BVddZJEwU79RuC1KPDRLZ8IPNqnA6Rhen9O3mv4JY7JZsExcKs1@vger.kernel.org
X-Gm-Message-State: AOJu0YxjnBCzOCt4W1IQsnNCRTYN5GD7EALjSwLIIt+QWOQallNJOI6/
	bTjXUxehKZ0NhzYmkUbUEx4Y6UsGa4n5ASzeWND1EUAS9ufAQwijqnaRerE8Ua89E65Q+1yCJIN
	TouVKneu0votLqTkdApWJqIZGCARMbzIGT5oaaJ1tHQ==
X-Gm-Gg: Acq92OFCYLP4y5qHeBUKNitsn5PKvHUq7D7yBtxQ70MmHqS+N9Exxh8dI/anUqM6GMj
	0kuebwhVXz/Ocqb9XvwMEOuGj9OEmz8hwUMx4AIHXMuqSBUG+WZ6Qgh5h9BPFEtdBCBDY57Bit+
	H6v+nyRCIYz86rVQp07Of+KaYQfI31+l9gRhhArkpO74HkZfQLkUxxPCd5+JP9GVnMPOC2soMfF
	Iw8qvabRvtztHM6OM8HY3W47iAvTyIrraJbifoNSTwUlr0ArWd8SQG595jzd3cgrdIeMIRewI3B
	BVkiy9v0E/2Oqu0YAwNtuY7KUsbQiD7yUYcTO4Y=
X-Received: by 2002:a05:620a:40cf:b0:913:e5bb:3dcb with SMTP id
 af79cd13be357-914b49da905mr475853185a.50.1779452940578; Fri, 22 May 2026
 05:29:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ahA4bMmH3OKGBDcv@sirena.org.uk>
In-Reply-To: <ahA4bMmH3OKGBDcv@sirena.org.uk>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 22 May 2026 14:28:48 +0200
X-Gm-Features: AVHnY4K2acL01x2bhcCTcBYXJD5P9Y_N86Rc5IoGImYKuLXDGLEXPJXLVaGlddQ
Message-ID: <CAJfpegvf5qBV08OFVU-Q-fYYS5vfEU2icZ+hT0baAsuDCW+6gg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the fuse tree with the
 vfs-brauner-fixes tree
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miklos Szeredi <mszeredi@redhat.com>
Content-Type: multipart/mixed; boundary="0000000000006b258c0652672c7f"

--0000000000006b258c0652672c7f
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 May 2026 at 13:05, Mark Brown <broonie@kernel.org> wrote:
>
> Hi all,
>
> Today's linux-next merge of the fuse tree got a conflict in:
>
>   fs/fuse/dev.c
>
> between commit:
>
>   eac1801510181 ("fuse: limit FUSE_NOTIFY_RETRIEVE to uptodate folios")
>
> from the vfs-brauner-fixes tree and commit:
>
>   77ad933a2e6d5 ("fuse: create notify.c")
>
> from the fuse tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> I'm not convinced this is fully correct, I didn't spot the equivalent
> code in notify.c, though given that I see the fix was acked by Miklos
> it may be that the issue is taken care of in the new FUSE code?

The code does exist in notify.c, it was just moved.  Attaching correct
merge resolution.

Thanks,
Miklos

--0000000000006b258c0652672c7f
Content-Type: text/x-patch; charset="US-ASCII"; name="t.patch"
Content-Disposition: attachment; filename="t.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mpgwau5q0>
X-Attachment-Id: f_mpgwau5q0

ZGlmZiAtLWNjIGZzL2Z1c2UvZGV2LmMKaW5kZXggMDhkMzY0ZWQ3ZDZjLGJlNGU2NmVkNjMzYy4u
MDAwMDAwMDAwMDAwCi0tLSBhL2ZzL2Z1c2UvZGV2LmMKKysrIGIvZnMvZnVzZS9kZXYuYwpkaWZm
IC0tZ2l0IGEvZnMvZnVzZS9ub3RpZnkuYyBiL2ZzL2Z1c2Uvbm90aWZ5LmMKaW5kZXggZjIwMGEz
M2YwNTMzLi4wNjIyOWM0YzA5N2UgMTAwNjQ0Ci0tLSBhL2ZzL2Z1c2Uvbm90aWZ5LmMKKysrIGIv
ZnMvZnVzZS9ub3RpZnkuYwpAQCAtMjc5LDYgKzI3OSwxMCBAQCBzdGF0aWMgaW50IGZ1c2VfcmV0
cmlldmUoc3RydWN0IGZ1c2VfbW91bnQgKmZtLCBzdHJ1Y3QgaW5vZGUgKmlub2RlLAogCQlmb2xp
byA9IGZpbGVtYXBfZ2V0X2ZvbGlvKG1hcHBpbmcsIGluZGV4KTsKIAkJaWYgKElTX0VSUihmb2xp
bykpCiAJCQlicmVhazsKKwkJaWYgKCFmb2xpb190ZXN0X3VwdG9kYXRlKGZvbGlvKSkgeworCQkJ
Zm9saW9fcHV0KGZvbGlvKTsKKwkJCWJyZWFrOworCQl9CiAKIAkJZm9saW9fb2Zmc2V0ID0gb2Zm
c2V0X2luX2ZvbGlvKGZvbGlvLCBwb3MpOwogCQlucl9ieXRlcyA9IG1pbihmb2xpb19zaXplKGZv
bGlvKSAtIGZvbGlvX29mZnNldCwgbnVtKTsK
--0000000000006b258c0652672c7f--
