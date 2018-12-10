From: Sabrina Dubroca <sd@queasysnail.net>
Subject: Re: linux-next: Signed-off-by missing for commits in the net-next
 tree
Date: Mon, 10 Dec 2018 14:55:45 +0100
Message-ID: <20181210135545.GA29631@bistromath.localdomain>
References: <20181210080045.0e67ad79@canb.auug.org.au>
 <20181209211139.GB21186@lunn.ch>
 <011f5be3-4bc1-2e64-0ddf-b43b8dbc4dcd@gmail.com>
 <20181209.162805.1102172618676272423.davem@davemloft.net>
 <20181210133500.GB4660@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181210133500.GB4660@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: David Miller <davem@davemloft.net>, hkallweit1@gmail.com, sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, f.fainelli@gmail.com
List-Id: linux-next.vger.kernel.org

2018-12-10, 14:35:00 +0100, Andrew Lunn wrote:
> > The problem here is the '--' delimiter, Andrew should have either
> > used nothing or something else.
> 
> I picked -- because it was not --- !
> 
> Anyway, lesson learned. But i kind of expect it will happen again to
> others, since the "Submitting Patches" documentation just mentions ---
> and does not say that other similar markers may also trigger the magic
> scissors.

-- doesn't trigger the scissors. It looks like patchwork replaced your
-- with a ---, as I wrote in my other reply.

-- 
Sabrina
