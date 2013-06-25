From: Ming Lei <ming.lei@canonical.com>
Subject: Re: linux-next: build warning after merge of the driver-core tree
Date: Tue, 25 Jun 2013 20:00:47 +0800
Message-ID: <CACVXFVNUzNxwjFnDGSEEKAn81Guy1bF2_GncYe1+-WKOXtrXdQ@mail.gmail.com>
References: <20130625183355.464b44df82ffc033aab31a4d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130625183355.464b44df82ffc033aab31a4d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Jun 25, 2013 at 4:33 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Greg,
>
> After merging the driver-core tree, today's linux-next build (powerpc
> allnoconfig) produced this warning:
>
> drivers/base/firmware_class.c:221:29: warning: 'fw_lookup_buf' defined but not used [-Wunused-function]
>
> Introduced by commit 90f8908127b5 ("firmware loader: fix compile warning
> with PM_SLEEP set").

OK, I will submit a patch to kill the warning later, thanks again for
your report.


Thanks,
--
Ming Lei
