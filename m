From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next] net: nixge: Fix Kconfig warning with OF_MDIO
Date: Sun, 02 Sep 2018 16:10:40 -0700 (PDT)
Message-ID: <20180902.161040.1009330568454902368.davem@davemloft.net>
References: <20180831203054.12132-1-mdf@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831203054.12132-1-mdf@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mdf@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, moritz.fischer@ettus.com, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

From: Moritz Fischer <mdf@kernel.org>
Date: Fri, 31 Aug 2018 13:30:54 -0700

> Fix Kconfig warning with OF_MDIO where OF_MDIO was
> selected unconditionally instead of only when
> OF is actually enabled.
> 
> Fixes 7e8d5755be0e ("net: nixge: Add support for 64-bit platforms")
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Moritz Fischer <mdf@kernel.org>

Applied, thanks.
