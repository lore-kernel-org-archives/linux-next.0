From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Subject: Re: [PATCH] usb/gadget: let file storage gadget select libcomposite
Date: Wed, 24 Oct 2012 19:45:08 +0200
Message-ID: <20121024174508.GA6014@breakpoint.cc>
References: <20121018144614.b61961cfae2274d52d340882@canb.auug.org.au>
 <50809624.30601@xenotime.net>
 <20121024144435.GF4368@breakpoint.cc>
 <xa1thapjlqv1.fsf@mina86.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <xa1thapjlqv1.fsf@mina86.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Nazarewicz <mina86@mina86.com>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Felipe Balbi <balbi@ti.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, USB list <linux-usb@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Oct 24, 2012 at 07:30:42PM +0200, Michal Nazarewicz wrote:
> At first it looks strange as FSG does not use composite, but yeah:

Yeah. However, it should be removed in v3.8 anyway :)

> Acked-by: Michal Nazarewicz <mina86@mina86.com>

Sebastian
