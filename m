From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Subject: Re: linux-next: Fixes tag needs some work in the v4l-dvb tree
Date: Wed, 29 May 2019 23:05:11 +0200
Message-ID: <20190529210511.GM1651@bigcity.dyn.berto.se>
References: <20190529080454.6d62a7fd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190529080454.6d62a7fd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
List-Id: linux-next.vger.kernel.org

Hi Stephen, Mauro,

On 2019-05-29 08:04:54 +1000, Stephen Rothwell wrote:
> Hi Mauro,
> 
> In commit
> 
>   0c310868826e ("media: rcar-csi2: Fix coccinelle warning for PTR_ERR_OR_ZERO()")
> 
> Fixes tag
> 
>   Fixes: 3ae854cafd76 ("rcar-csi2: Use standby mode instead of resetting")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Did you mean
> 
> Fixes: d245a940d97b ("media: rcar-csi2: Use standby mode instead of resetting")

Yes I meant d245a940d97b commit, for some reason I was on the wrong 
branch when looking up the sha1 for the fixes tag and used one from a 
local development branch.

This is my mess, sorry about that. What can I do to help fix it?

-- 
Regards,
Niklas Söderlund
