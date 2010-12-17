From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: linux-next: build warnings after merge of the ia64 tree
Date: Thu, 16 Dec 2010 16:50:14 -0800
Message-ID: <987664A83D2D224EAE907B061CE93D530193D00A15@orsmsx505.amr.corp.intel.com>
References: <20101217112357.ec7879f1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

> Hmmmh. I wonder why I didn't see them in my build?

Ah - because I only built against Linus' tree, and linux-next
has:

commit 3b38bb5f7f06356a89bb2cbf92ad346025e95192
Author: Huang Ying <ying.huang@intel.com>
Date:   Thu Dec 2 10:40:53 2010 +0800

    ACPI, APEI, use raw spinlock in ERST

Drop the ia64/test branch if you like.

-Tony
