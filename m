From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: Signed-off-by missing for commits in the net-next
 tree
Date: Sun, 09 Dec 2018 16:31:52 -0800 (PST)
Message-ID: <20181209.163152.1641648923109797638.davem@davemloft.net>
References: <011f5be3-4bc1-2e64-0ddf-b43b8dbc4dcd@gmail.com>
        <20181209214907.GC21186@lunn.ch>
        <20181209232722.GA4425@bistromath.localdomain>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181209232722.GA4425@bistromath.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: sd@queasysnail.net
Cc: andrew@lunn.ch, hkallweit1@gmail.com, sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, f.fainelli@gmail.com
List-Id: linux-next.vger.kernel.org

From: Sabrina Dubroca <sd@queasysnail.net>
Date: Mon, 10 Dec 2018 00:27:22 +0100

> Maybe Stephen's script to detect those missing sign-offs could be run
> as a commit/apply hook by David? This happens regularly, sometimes
> dropping more than just a sign-off.

Yeah, that would probably be a good idea, maybe something even on the
git.kernel.org side that won't let me push if I'm sending commits that
have this problem.
