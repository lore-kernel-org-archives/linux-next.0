From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Nov 26 (staging/fwserial)
Date: Mon, 26 Nov 2012 12:56:07 -0800
Message-ID: <50B3D767.70604@infradead.org>
References: <20121127011738.9ecd7971a7ea2e3d09a9450d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121127011738.9ecd7971a7ea2e3d09a9450d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Andrew Morton <akpm@linux-foundation.org>, Peter Hurley <peter@hurleysoftware.com>
List-Id: linux-next.vger.kernel.org

On 11/26/2012 06:17 AM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20121115:
> 


on i386:

drivers/staging/fwserial/dma_fifo.c: In function 'dma_fifo_in':
drivers/staging/fwserial/dma_fifo.c:174:2: error: implicit declaration of function '__WARN_printf'


-- 

~Randy
