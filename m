From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: linux-next: please cleanup the cpuidle tree
Date: Tue, 08 Jan 2013 00:11:50 +0100
Message-ID: <50EB5636.4080705@linaro.org>
References: <20130108092751.4bd60a67280e284369553c18@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:41359 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751798Ab3AGXLv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Jan 2013 18:11:51 -0500
Received: by mail-we0-f176.google.com with SMTP id r5so10824150wey.35
        for <linux-next@vger.kernel.org>; Mon, 07 Jan 2013 15:11:50 -0800 (PST)
In-Reply-To: <20130108092751.4bd60a67280e284369553c18@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 01/07/2013 11:27 PM, Stephen Rothwell wrote:
> Hi Daniel,
>=20
> All the commits in the cpuidle tree have been included upstream befor=
e
> v3.6-rc1.  They were rewritten before being merged upstream and so ar=
e
> now causing merge conflicts in linux-next.  Could you please reset th=
e
> head of your tree
> (git://git.linaro.org/people/dlezcano/cpuidle-next.git#cpuidle-next) =
to
> be somewhere in the tree that yours is merged into (pm or Linus').

Sure. I believe it is done now.

> Alternatively, if you are not using it any more, let me know and I wi=
ll
> remove it from linux-next.

I am planning to do some more cleanup in a very near future. So I prefe=
r
to keep it untouched for now.

Thanks
  -- Daniel

--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
