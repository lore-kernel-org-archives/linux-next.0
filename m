From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] PCI: mvebu: Restrict build to 32-bit ARM
Date: Thu, 18 Feb 2016 15:06:23 +0100
Message-ID: <5051836.EUN3ennYNm@wuerfel>
References: <1455802330-17565-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455802330-17565-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Thierry Reding <thierry.reding@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: linux-next.vger.kernel.org

On Thursday 18 February 2016 14:32:10 Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This driver uses PCI glue that is only available on 32-bit ARM. This
> used to work fine as long as ARCH_MVEBU and ARCH_DOVE were exclusively
> 32-bit, but that's changed now, with ARCH_MVEBU also being available
> on 64-bit ARM.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Looks fine as a temporary workaround, but I think what we really want to
do here is to remove the dependency, as the new ARM64 platforms are going
to need this driver anyway.

	Arnd
