From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: failed import of the i2c quilt series
Date: Mon, 19 Jul 2010 11:26:46 +0200
Message-ID: <20100719112646.12d35b56@hyperion.delvare>
References: <20100713102736.b66c2c2f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100713102736.b66c2c2f.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Tue, 13 Jul 2010 10:27:36 +1000, Stephen Rothwell wrote:
> Importing of the i2c quilt tree this morning produced this error:
> 
> i2c-drop-preliminary-probability-checks.patch
> error: patch failed: drivers/i2c/i2c-core.c:1456
> error: drivers/i2c/i2c-core.c: patch does not apply
> 
> I will use the i2c tree from next-20100712 for today.

Probably caused by me not being quick enough to remove the patches from
my queue after Linus merged them (I was travelling.) Should be fixed by
now.

-- 
Jean Delvare
