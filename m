From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the slave-dma tree
Date: Fri, 16 Oct 2015 01:27:53 +1100
Message-ID: <20151016012753.01671593@canb.auug.org.au>
References: <20151015115108.57c04f61@canb.auug.org.au>
	<1444880141.2926.28.camel@intel.com>
	<20151015145142.54e537a4@canb.auug.org.au>
	<5852722.yfOrjUKMax@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5852722.yfOrjUKMax@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Koul, Vinod" <vinod.koul@intel.com>, "hch@lst.de" <hch@lst.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Arnd,

On Thu, 15 Oct 2015 16:07:51 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
>
> I've added a workaround to the asm-generic tree, no need to worry about
> it for now. We can change over the remaining users of
> asm-generic/io-64-nonatomic-lo-hi.h for the following merge window and
> then remove the wrapper.

Thanks.  I have dropped my merge fix patches as well.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
