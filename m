From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: import of i2c series failed
Date: Fri, 19 Jun 2009 09:00:45 +0200
Message-ID: <20090619090045.59899d69@hyperion.delvare>
References: <20090619101020.9b1f5054.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757112AbZFSHBL@vger.kernel.org>
In-Reply-To: <20090619101020.9b1f5054.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Fri, 19 Jun 2009 10:10:20 +1000, Stephen Rothwell wrote:
> Hi Jean,
> 
> I got this error import the i2c quilt series:
> 
> i2c-core-07-limit-locking.patch
> error: patch failed: drivers/i2c/i2c-core.c:418
> error: drivers/i2c/i2c-core.c: patch does not apply
> 
> I noticed that the BASE changed from 3.6.30-git11 yesterday to just
> 2.6.30 today, so I tried again against 2.6.30-git11 and it all applied.

User error, sorry about that. I erroneously updated the series file
while the latest git patch was temporarily not applied to my local
tree. It's all fixed now, sorry for the trouble.

-- 
Jean Delvare
