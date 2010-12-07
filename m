From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [PATCH -next] media: fix em28xx build, needs interrupt.h
Date: Tue, 7 Dec 2010 20:44:53 +0200
Message-ID: <20101207184453.GA30998@core2.telecom.by>
References: <20101206140055.34289498.sfr@canb.auug.org.au>
 <AANLkTi=XkxnHZGTEsrrRmPGQePitzb=akyS99_Qd6ROy@mail.gmail.com>
 <20101207103815.26054c38.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101207103815.26054c38.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Zimny Lech <napohybelskurwysynom2010@gmail.com>, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Dec 07, 2010 at 10:38:15AM -0800, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> drivers/media/video/em28xx/em28xx-vbi.c:49: error: implicit declaration of function 'in_interrupt'

> +#include <linux/interrupt.h>

It's defined in hardirq.h.
