From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: rebase of the jdelvare-hwmon quilt series
Date: Thu, 11 Jul 2013 07:57:00 +0200
Message-ID: <20130711075700.21d8482c@endymion.delvare>
References: <20130711102724.51608a4ace419b6d42591257@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130711102724.51608a4ace419b6d42591257@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Thu, 11 Jul 2013 10:27:24 +1000, Stephen Rothwell wrote:
> Why have you just rebased the jdelvare-hwmon series
> (http://khali.linux-fr.org/devel/linux-3/jdelvare-hwmon/)?  You have
> just invalidated your testing and made it likely that Linus will blast
> you if you ask him to pull your patches.  Your whole series was already
> based after v3.10 (i.e. released or rebased after the merge window
> opened), so why move it again?

I'm quite confused by this complaint of yours. I do not have the
feeling that I rebased anything or invalidated any testing. And I don't
think I did anything different this time from the way I have been
proceeding for years.

I had only 2 hwmon patches for Linus for this merge window:
  hwmon-lm63-drop-redundant-safety.patch
  hwmon-lm90-drop-redundant-safety.patch

They have been in
http://khali.linux-fr.org/devel/linux-3/jdelvare-hwmon/ (and thus in
linux-next) continuously since May 19th so I'd say they received pretty
good testing. I did not touch them, I did not even have to refresh them.

3 days ago I added these 2 patches to the hwmon-for-linus branch of my
staging tree:
http://git.kernel.org/cgit/linux/kernel/git/jdelvare/staging.git/log/?h=hwmon-for-linus
and asked Linux to pull from it.

Yesterday I reviewed a new (trivial) hwmon patch, and I accepted it, so
it was added to http://khali.linux-fr.org/devel/linux-3/jdelvare-hwmon/ as 
hwmon-w83792d-update-module-author.patch (and thus went to linux-next.)

Last night Linus pulled from
http://git.kernel.org/cgit/linux/kernel/git/jdelvare/staging.git/log/?h=hwmon-for-linus
so the 2 "old" patches are now merged upstream. The one "new" patch
is not, it will get upstream next time I ask Linus to pull from my
staging tree.

This is how things have happened, and I just can't see anything wrong.
If you do, please explain what you thing shouldn't have happened, and
let me know what I should have done instead.

Thanks,
-- 
Jean Delvare
