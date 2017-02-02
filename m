From: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Thu, 2 Feb 2017 21:24:40 -0200
Message-ID: <20170202212440.5e514ebc@vento.lan>
References: <20170131115505.3f8c769b@canb.auug.org.au>
        <20170203092446.7e86e8af@canb.auug.org.au>
        <20170202204620.75b20605@vento.lan>
        <20170203095934.2bbbbf45@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170203095934.2bbbbf45@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sean Young <sean@mess.org>
List-Id: linux-next.vger.kernel.org

Em Fri, 3 Feb 2017 09:59:34 +1100
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi Mauro,
> 
> On Thu, 2 Feb 2017 20:46:20 -0200 Mauro Carvalho Chehab <mchehab@osg.samsung.com> wrote:
> >
> > Gah, forgot to push the fix on the -next branch. Should be ok now.  
> 
> What I fetch for the v4l-dvb tree is the master branch of
> git://linuxtv.org/mchehab/media-next.git

I actually push the patches on a different tree:
	git://linuxtv.org/media_tree.git

At the branches "master" and "fixes", where

master - for rolling develoment patches
fixes - for bug fixes against current -rc release

My current procedure is to manually merge both branches
at git://linuxtv.org/mchehab/media-next.git, but this is a manual
work, that I use to do by the end of the days I merge patches.
Unfortunately, sometimes, I got side-tracked by something and
I forget to do such manual merge.

-- 
Thanks,
Mauro
