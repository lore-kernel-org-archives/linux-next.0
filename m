From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: [PATCH -next] ide: fix Makefile for ide-disk_proc
Date: Tue, 2 Sep 2008 20:47:38 +0200
Message-ID: <200809022047.38151.bzolnier@gmail.com>
References: <48BD89A6.1040200@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-ide-owner@vger.kernel.org>
In-Reply-To: <48BD89A6.1040200@oracle.com>
Content-Disposition: inline
Sender: linux-ide-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-ide@vger.kernel.org, linux-next@vger.kernel.org, akpm <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Tuesday 02 September 2008, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix ide-disk_proc build error due to 2 entries in Makefile, one of them
> being unconditional.
> 
> When CONFIG_IDE_PROC_FS=n, there are lots of errors/warnings:

Thanks but this was already fixed in pata tree
(http://lkml.org/lkml/2008/9/2/65).
