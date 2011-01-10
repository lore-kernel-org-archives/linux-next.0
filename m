From: Guenter Roeck <guenter.roeck@ericsson.com>
Subject: Re: linux-next: manual merge of the hwmon-staging tree with the
 jdelvare-hwmon tree
Date: Sun, 9 Jan 2011 19:46:38 -0800
Message-ID: <20110110034638.GA28007@ericsson.com>
References: <20110110132057.bc5d54a0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110110132057.bc5d54a0.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>, Juerg Haefliger <juergh@gmail.com>, Jean Delvare <khali@linux-fr.org>
List-Id: linux-next.vger.kernel.org

On Sun, Jan 09, 2011 at 09:20:57PM -0500, Stephen Rothwell wrote:
> Hi Guenter,
> 
> Today's linux-next merge of the hwmon-staging tree got a conflict in
> drivers/hwmon/dme1737.c between commit
> b7f2a5c8c9190fcf0126d43972a8ad37eb98f5d0 ("hwmon: (dme1737) Minor
> cleanups") from the jdelvare-hwmon tree and commit
> 9c6e13b411cf0f656b7d7a78ec35bf0069f631bb ("hwmon: (dme1737) Use pr_fmt
> and pr_<level>") from the hwmon-staging tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
Hi Stephen,

thanks for the note. I suspected that would happen - sorry for the trouble.

Jean, do you want to take Joe's pr_fmt change from my tree and apply it to yours,
or should we just wait until the first of the trees was merged into Linus' tree ?
If the latter, do you want to send your patches to Linus first, or should I go first ?
I am ready to go.

Thanks,
Guenter
