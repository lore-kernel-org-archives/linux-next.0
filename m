From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the final tree (akpm
 tree related)
Date: Wed, 14 Nov 2012 17:30:59 -0500 (EST)
Message-ID: <20121114.173059.2152995770988231211.davem@davemloft.net>
References: <20121109150957.4f274fa7b3a75c9baaa1b7ff@canb.auug.org.au>
	<20121114141847.fab752c2.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121114141847.fab752c2.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, walken@google.com, riel@redhat.com
List-Id: linux-next.vger.kernel.org

From: Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 14 Nov 2012 14:18:47 -0800

> s/colour/color/

The whole file uses the COLOUR spelling in it's macros, for
consistency I see no reason not to use the same spelling
for local variables.

Else, fix the whole file instead of leaving an inconsistent
mess around.
