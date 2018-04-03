From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Tue, 03 Apr 2018 13:41:19 +0100
Message-ID: <29194.1522759279@warthog.procyon.org.uk>
References: <20180403154122.00d76d61@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180403154122.00d76d61@canb.auug.org.au>
Content-ID: <29193.1522759279.1@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> +	wait_var_event(&rxnet->nr_calls, !atomic_read(&rxnet->nr_calls));

I would prefer == 0 to ! as it's not really a true/false value.

But apart from that, it's looks okay and you can add my Reviewed-by.

David
