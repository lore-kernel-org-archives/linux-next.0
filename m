From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: i2c series import failure
Date: Thu, 30 Jul 2009 08:43:36 +0200
Message-ID: <20090730084336.273a9ce6@hyperion.delvare>
References: <20090730104443.49df80a0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752460AbZG3Gnl@vger.kernel.org>
In-Reply-To: <20090730104443.49df80a0.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Thu, 30 Jul 2009 10:44:43 +1000, Stephen Rothwell wrote:
> Today's linux-next import of the i2c series failed like this:
> 
> i2c-tsl2550-simpify-IO.patch
> error: patch failed: drivers/i2c/chips/tsl2550.c:24
> error: drivers/i2c/chips/tsl2550.c: patch does not apply
> 
> I will use the series from yesterday.

Sorry about that. I have just moved to a new flat and could not update
my published series yesterday (no Internet access.) This should be all
fixed now.

-- 
Jean Delvare
