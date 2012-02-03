From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: linux-next: manual merge of the gpio tree with the regulator
 tree
Date: Fri, 3 Feb 2012 10:15:08 +0530
Message-ID: <4F2B6654.8060106@nvidia.com>
References: <20120203134415.624d07b379876f1e5f0c644a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120203134415.624d07b379876f1e5f0c644a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Grant Likely <grant.likely@secretlab.ca>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>
List-Id: linux-next.vger.kernel.org

On Friday 03 February 2012 08:14 AM, Stephen Rothwell wrote:
> * PGP Signed by an unknown key
>
> Hi Grant,
>
> Today's linux-next merge of the gpio tree got a conflict in
> include/linux/mfd/tps65910.h between commit 1e0c66f49762 ("regulator:
> tps65910: Sleep control through external inputs") from the regulator tree
> and commit 290705988073 ("gpio: tps65910: Add sleep control support")
> from the gpio tree.
>
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.
Yes, merge is fine.. Thanks for taking care of conflicts.
