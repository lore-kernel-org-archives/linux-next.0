From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Wed, 16 Mar 2016 14:59:38 +0100
Message-ID: <4892345.flKnDo9XDS@wuerfel>
References: <20160315174634.6766cd88@canb.auug.org.au> <15874870.hBfxUomX5V@wuerfel> <CAHp75VcxkBTSKY_bVg3jaUPUtcyxKZ14sbu=uJK403xRmTYbbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcxkBTSKY_bVg3jaUPUtcyxKZ14sbu=uJK403xRmTYbbQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Benjamin LaHaise <bcrl@kvack.org>, linux-next <linux-next@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
List-Id: linux-next.vger.kernel.org

On Wednesday 16 March 2016 13:12:36 Andy Shevchenko wrote:
> 
> > I've also sent a patch that fixes the link error on ARM and that should
> > work on all other architectures too.
> 
> In case of avr32 signalfd_read() fails. Does your patch help with it as well?
> 
> P.S. Bisecting shows same culprit: 150a0b4905f1 ("aio: add support for
> async openat()")

I don't know. What is the symptom on avr32? My patch only removes the
get_user() instances on 64-bit values and replaces them with a
single copy_from_user() call.

	Arnd
