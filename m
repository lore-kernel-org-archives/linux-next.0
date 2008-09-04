From: Jiri Slaby <jirislaby@gmail.com>
Subject: Re: [PATCH] hid: fix gyration build error
Date: Thu, 04 Sep 2008 08:52:55 +0200
Message-ID: <48BF85C7.5050401@gmail.com>
References: <20080903191619.6b6b230e.sfr@canb.auug.org.au> <20080903193218.d79e0f1a.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755876AbYIDGxU@vger.kernel.org>
In-Reply-To: <20080903193218.d79e0f1a.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, jkosina@suse.cz, akpm <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On 09/04/2008 04:32 AM, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix config symbol name in ifdef to fix build error:
> 
> ERROR: "hid_compat_gyration" [drivers/hid/hid-dummy.ko] undefined!
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> cc: Jiri Kosina <jkosina@suse.cz>

Acked-by: Jiri Slaby <jirislaby@gmail.com>

Thanks for catching this. My cut&paste typo.
