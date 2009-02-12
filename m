From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for February 12 (ide)
Date: Thu, 12 Feb 2009 08:44:16 -0800
Message-ID: <499451E0.6060004@oracle.com>
References: <20090212194408.ff7489c1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-ide-owner@vger.kernel.org>
In-Reply-To: <20090212194408.ff7489c1.sfr@canb.auug.org.au>
Sender: linux-ide-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-ide@vger.kernel.org, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090211:


When
# CONFIG_BLK_DEV_IDEDMA is not set

linux-next-20090212/drivers/ide/ide-taskfile.c:108: error: 'ide_dma_intr' undeclared (first use in this function)


-- 
~Randy
