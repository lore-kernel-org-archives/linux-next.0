From: "Randy.Dunlap" <rdunlap@xenotime.net>
Subject: Re: [PATCH -next] ide: fix Makefile for ide-disk_proc
Date: Tue, 2 Sep 2008 11:53:34 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.0809021151350.13796@shark.he.net>
References: <48BD89A6.1040200@oracle.com> <200809022047.38151.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-ide-owner@vger.kernel.org>
In-Reply-To: <200809022047.38151.bzolnier@gmail.com>
Sender: linux-ide-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, linux-ide@vger.kernel.org, linux-next@vger.kernel.org, akpm <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Tue, 2 Sep 2008, Bartlomiej Zolnierkiewicz wrote:

> On Tuesday 02 September 2008, Randy Dunlap wrote:
> > From: Randy Dunlap <randy.dunlap@oracle.com>
> > 
> > Fix ide-disk_proc build error due to 2 entries in Makefile, one of them
> > being unconditional.
> > 
> > When CONFIG_IDE_PROC_FS=n, there are lots of errors/warnings:
> 
> Thanks but this was already fixed in pata tree
> (http://lkml.org/lkml/2008/9/2/65).

Thanks, good to hear that...

-- 
~Randy
