From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Please include ux500 core into linux-next
Date: Tue, 30 Nov 2010 10:31:43 +0100
Message-ID: <AANLkTi=fXAucNc-m9dqb0cgA6mGJ5c4cXC-pTOz05vwY@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-dev <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Rabin VINCENT <rabin.vincent-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

please consider to start merging our ux500-core branch into
linux-next:

git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-stericsson.git
Branch: ux500-core

(NB: there is a "next" branch, which include patches to multiple
subsystems, don't merge that, this is just the ux500 core.)

I rebase this regularly to Torvalds' -rc tags, hope that's OK.

All code is being reviewed on the linux-arm-kernel list, and the
patches here are intended for pull request to Russell King who
in turn take them upstream. I hope this procedure is
acceptable.

We currently have some of these patches in Russells patch tracker
as well, but they will be taken out in favor of the pull approach
once this branch lands in -next.

Yours,
Linus Walleij
