From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please include Aspeed ARM SoC tree in linux-next
Date: Thu, 12 Jan 2017 08:17:15 +1100
Message-ID: <20170112081715.59f50b35@canb.auug.org.au>
References: <CACPK8XcCPXWsVjufu0RAjGRjegTLuXAOHO7SbqXx8iTCJ4hbUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACPK8XcCPXWsVjufu0RAjGRjegTLuXAOHO7SbqXx8iTCJ4hbUA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

Hi Joel,

On Wed, 11 Jan 2017 12:11:29 +1100 Joel Stanley <joel@jms.id.au> wrote:
>
> I'm the maintainer for the Aspeed ARM SoC tree and I would like it
> added to linux-next.
> 
> The tree is a sub-maintainer tree for the Aspeed family of 32-bit ARM
> SoCs that went upstream earlier last year.
> 
> Tree: git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
> Branch: for-next
> 
> for-next is a merge of the trees that I intend to send to the ARM
> maintainers for 4.11.
> 
> For now please notify just myself if something breaks.

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window. 

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and 
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

-- 
Cheers,
Stephen Rothwell 
sfr@canb.auug.org.au
