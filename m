From: Florian Westphal <fw@strlen.de>
Subject: Re: linux-next: Tree for Dec 21
Date: Fri, 21 Dec 2018 21:57:44 +0100
Message-ID: <20181221205744.piiwyctaxbbkdc56@breakpoint.cc>
References: <20181221193244.3a6ed685@canb.auug.org.au>
 <20181221162149.GA32500@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181221162149.GA32500@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joel Fernandes <joel@joelfernandes.org>, "Kirill A. Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, Sinan Kaya <okaya@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Chandan Rajendra <chandan@linux.vnet.ibm.com>, Theodore Ts'o <tytso@mit.edu>, Florian Westphal <fw@strlen.de>, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wen He <wen.he_1@nxp.com>, Peng Ma <peng.ma@nxp.com>, Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@sifive.com>
List-Id: linux-next.vger.kernel.org

Guenter Roeck <linux@roeck-us.net> wrote:
> 	mips:cavium_octeon_defconfig [4]

> git bisect bad 4165079ba328dd47262a2183049d3591f0a750b1
> # first bad commit: [4165079ba328dd47262a2183049d3591f0a750b1] net: switch secpath to use skb extension infrastructure

Indeed, sorry.  staging/octeon needs a small fix.  Will send a patch asap.
