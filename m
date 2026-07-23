Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321363D967F
	for <linux-next@vger.kernel.org>; Thu, 23 Jul 2026 20:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784838126; cv=none; b=DK3Ii3FPSJt+RmLSJwIXTIHuQGH9b43A6xkJPnUoJ5Ot8FsVji6bUdYzGXumZ5eBKnDq6OaU25DSMsSmbIay0cGPhkRkiK2CiI43a6rrlIHFLh0H9ahkyIPC7KGEZfKCMWCbSyrldf7O3M7mBywaTSkePXtAC0jJ1SLrU6xBgHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784838126; c=relaxed/simple;
	bh=UvNFjVJt3A7v6MKSV0fCcl/Kvk133EkSapsUZJ16PEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E0C/UF+nmQyaanXP4TyHhBt490/gb4+nuxOvXEW//20Exy/MYCD2AFJQNDHPOAqBQFOIhEVYn5h3C4wXKAX4QldKmvO6EB6oQ5PL1ttBiNcgvvon5jptcetErQFzSFlbg2etHKtonqVU8XtrYMNTA2ZHGrQth31RYQQaIMuzvhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZNEcbvT; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZNEcbvT"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84874b52eabso1447498b3a.0
        for <linux-next@vger.kernel.org>; Thu, 23 Jul 2026 13:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784838124; x=1785442924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ivr3zf0J1qyWYjxVIvGBofjs0Q7zbDQA3/AdjyP35eM=;
        b=cZNEcbvTiD4aovB5VIqSTKHHIx7tU1nu++hX7evMp6p725WB/zi+Fl71gh9iTzIYl2
         vFnXpSXFZxXcZuoqQxiJPOgL62U7cGz3u6QevfoP29dEuuQLiCrnhxHaTFq/w4OQW94U
         m0V5Xoi1p7rwIa7xmHIZaWmNmUVHmFl3ZQQPL4Xa7nGf+1IpEOn50BkgMprwpY2OTYib
         jVBA+Upy1CqT8HLJlfKEE2Os6W6F3AIXC3k0kRqIgB3X8LjS0b0fHjcRxVx8Urb3XEGR
         z75qrRj4hmjkYjndtOmZtezzT6LHYu3XwWvLFlJY2tjKdJFULCAIz1QUG0vh+U+jV5ik
         sq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784838124; x=1785442924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ivr3zf0J1qyWYjxVIvGBofjs0Q7zbDQA3/AdjyP35eM=;
        b=GLFrDdK6j3r2REhBWpWHuLOx+rnugs7QHiR6y2XcmwUGAdPZUmtQ0pRgNQQwOoDCsC
         r5cXHcKz7yVFqAmBvC1nOB5+QDT+lQ4LRJMdrebCS4LKO3cY3g1rXAqwbazNm5M4e2KU
         0dtCF/V8GakKOFbWmB7HvR/vwxh1rqcSxK86lpU4JlLey7Pm2cPaKhIlanYDD/ts9sGJ
         XNiNLIobEzw6/IDcR/RszxdEhZs6dC58DmrphHRXHcIP3LmduObWj5ltFvwbUJWeCWNt
         231VhBgItGJQouIpyVgaANpOOnzL+ZoP+v+YQzWX8qFIwxiSO0p2H5tm8DUElpRiRQ8H
         m0Lw==
X-Forwarded-Encrypted: i=1; AHgh+RpPdkuwKNXDTAtIRB3oCoqvGwaaDgtYQGO+vJmqocBFXfrnhx0P20/2TUwMyZMf7N9OsoMaNN+C5lk8@vger.kernel.org
X-Gm-Message-State: AOJu0YyaUJZ2EzbXH4hvWdiFGNbIuBN9gHMFnlldqILzQyK+aXkZjrGZ
	H2+jxP5YtuJiUJ+6/zLhVhgUEEDP1hYlAme9cFr7kKeROVcf8lhDqwFx
X-Gm-Gg: AR+sD12R2A9zwzfB/M/Zh9hEN0UkA/p7Uha7mmRFsHFK3y1orZUecQ2T4J9O4X8G7vQ
	birHGmEjXropRmj3WqETI6ut6qHcRUtqHLv34QE/Xl+61AMKJ41tCy1KiyuOsj+mkBju598GomN
	AY8IlPVztmgOxMc71lC5KZzIzo0yhG1gBJbb5zlVyMF/VaJdU1LjmJ2sSbr1Z0SQuLlDwDUNVT8
	gQyM6uvmbfnX1JiJLvNFzICZVKO3X4ECnj4NpZEH0Cvq6Geam2TSmqT9bKCHPDj8AOVUFgFaRPK
	bs7JtbMh560JefIiBkMtgZv/y3u+WjJMBDKupt1RBTzrENEi6Fke7DRX+shoVLC1WJhCPVX0p8u
	//CbxBac75mLOuCQLDS0V0dVExtRx12sFMcROCeYQSWZ8DHKj1lv8NizbdU+ezDAPMsFwuV2O/t
	8HyDo5CW+tRCIFFJybwUGRj9w1F7oq2/dxZ9sDLmY0ZlKPWhtde+I=
X-Received: by 2002:a05:6a00:bb84:b0:848:4faa:480b with SMTP id d2e1a72fcca58-84e2bbed051mr5675121b3a.12.1784838124207;
        Thu, 23 Jul 2026 13:22:04 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([61.141.241.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17604a46sm3670338b3a.60.2026.07.23.13.21.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jul 2026 13:22:03 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>
Subject: Re: linux-next: manual merge of the wireless-next tree with the origin tree
Date: Fri, 24 Jul 2026 04:21:53 +0800
Message-ID: <20260723202153.97352-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <ac48f782-3fbd-4c61-89d0-4dd032ca81b9@sirena.org.uk>
References: <ac48f782-3fbd-4c61-89d0-4dd032ca81b9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Jul 23, 2026 at 7:51 PM Mark Brown <broonie@kernel.org> wrote:
> On Wed, Jul 22, 2026 at 03:53:59PM -0500, Enderaoe Lyther wrote:
>
> > I noticed one semantic conflict later in ieee80211_rx_mgmt_assoc_resp().
>
> I can't tell which bit of code you are talking about here.  I see there
> is a block at line 7274 of -next:
>
>         if (elems->aid_resp)
>                 aid = le16_to_cpu(elems->aid_resp->aid);
>         else if (!assoc_data->s1g)
>                 aid = le16_to_cpu(mgmt->u.assoc_resp.aid);
>         else if (status_code == WLAN_STATUS_SUCCESS)
>                 goto notify_driver;

Sorry about the formatting in my earlier message. I should have quoted the
code inline instead of top-posting.

That last branch was introduced by 035ed430ce6a ("wifi: mac80211: avoid
non-S1G AID fallback for S1G assoc") as:

	else if (status_code == WLAN_STATUS_SUCCESS)
		goto abandon_assoc;

f13e573ab3f12 ("wifi: mac80211: notify driver before destroying assoc
link") consolidated terminal association cleanup at destroy_assoc_data
and removed abandon_assoc. The conflict resolution retargeted this branch
to notify_driver, but notify_driver only calls drv_mgd_complete_tx()
without destroying the association data.

Since assoc_status is initialized to ASSOC_ABANDON at function entry, the
equivalent target is destroy_assoc_data. A successful S1G association
response with no AID Response element otherwise leaves assoc_data live
instead of abandoning it.

> but that is immediately after another goto notify_driver, there's
> further notify_driver error handling afterwards and all the earlier
> error handling is return statements so it looks at least unclear what's
> supposed to be going on.

Other goto notify_driver targets are intentional:

  - "if (!elems) goto notify_driver" is a pre-existing allocation failure
    bail-out; so association timeout handles cleanup.

  - The comeback path WLAN_STATUS_ASSOC_REJECTED_TEMPORARILY keeps
    assoc_data live deliberately for retry.

A successful S1G response without an AID Response element is terminal.
It needs to abandon association immediately, so the target should be
destroy_assoc_data rather than notify_driver.

> Please don't top post, reply in line with needed context.

Understood. Sorry for the unclear top-posted reply.

Zhao
