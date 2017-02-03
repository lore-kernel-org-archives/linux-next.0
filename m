From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Fri, 3 Feb 2017 11:01:17 +1100
Message-ID: <20170203110117.4a0c5628@canb.auug.org.au>
References: <20170131115505.3f8c769b@canb.auug.org.au>
        <20170203092446.7e86e8af@canb.auug.org.au>
        <20170202204620.75b20605@vento.lan>
        <20170203095934.2bbbbf45@canb.auug.org.au>
        <20170202212440.5e514ebc@vento.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170202212440.5e514ebc@vento.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sean Young <sean@mess.org>
List-Id: linux-next.vger.kernel.org

Hi Mauro,

On Thu, 2 Feb 2017 21:24:40 -0200 Mauro Carvalho Chehab <mchehab@osg.samsung.com> wrote:
>
> I actually push the patches on a different tree:
> 	git://linuxtv.org/media_tree.git
> 
> At the branches "master" and "fixes", where
> 
> master - for rolling develoment patches
> fixes - for bug fixes against current -rc release

So maybe I should fetch those 2 branches separately and save you the
bother of merging them yourself?  There will be occasional conflicts,
but I get those with others trees as well.

> My current procedure is to manually merge both branches
> at git://linuxtv.org/mchehab/media-next.git, but this is a manual
> work, that I use to do by the end of the days I merge patches.
> Unfortunately, sometimes, I got side-tracked by something and
> I forget to do such manual merge.

Unless you need to do that for your own testing.

-- 
Cheers,
Stephen Rothwell
