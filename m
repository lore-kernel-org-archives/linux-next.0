From: "Gustavo F. Padovan" <padovan@profusion.mobi>
Subject: Re: linux-next: build failure after merge of the bluetooth tree
Date: Thu, 28 Apr 2011 01:12:03 -0300
Message-ID: <20110428041202.GB2214@joana>
References: <20110428114118.dd5a74e0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110428114118.dd5a74e0.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

* Stephen Rothwell <sfr@canb.auug.org.au> [2011-04-28 11:41:18 +1000]:

> Hi Gustavo,
> 
> After merging the bluetooth tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> net/bluetooth/cmtp/core.c: In function 'cmtp_add_connection':
> net/bluetooth/cmtp/core.c:349: error: 'struct l2cap_pinfo' has no member named 'omtu'
> net/bluetooth/cmtp/core.c:349: error: 'struct l2cap_pinfo' has no member named 'imtu'
> net/bluetooth/hidp/core.c: In function 'hidp_add_connection':
> net/bluetooth/hidp/core.c:982: error: 'struct l2cap_pinfo' has no member named 'omtu'
> net/bluetooth/hidp/core.c:982: error: 'struct l2cap_pinfo' has no member named 'imtu'
> net/bluetooth/hidp/core.c:983: error: 'struct l2cap_pinfo' has no member named 'omtu'
> net/bluetooth/hidp/core.c:983: error: 'struct l2cap_pinfo' has no member named 'imtu'
> 
> Caused by commit 6657e8f0cc05 ("Bluetooth: Move more channel info to
> struct l2cap_chan").

Thanks for spotting this, It's fixed now.

-- 
Gustavo F. Padovan
http://profusion.mobi
