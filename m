From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [linux-next] rtlwifi commit contains a patch reject file
Date: Tue, 23 Apr 2019 12:15:16 +0200
Message-ID: <9ebd031d208aae52b787905eb4fb5e04a1d52969.camel@sipsolutions.net>
References: <20190420155008.GM23044@windriver.com>
         <20190422125926.15862fdd@canb.auug.org.au>
         (sfid-20190422_045942_518263_99E79F6A)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20190422125926.15862fdd-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> (sfid-20190422_045942_518263_99E79F6A)
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Cc: Larry Finger <Larry.Finger-tQ5ms3gMjBLk1uMJSBkQmQ@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Mon, 2019-04-22 at 12:59 +1000, Stephen Rothwell wrote:

> I have added that test to my commit checks now.  Thanks for the
> suggestion.  So far it only checks for .rej and .orig files - any
> others?

Maybe consider the things listed in the .gitignore file? Those are quite
difficult to add (git add -f) but I think I've seen it happen before,
perhaps through different trees etc.

In fact, *.orig is listed in .gitignore, I wonder why *.rej isn't? Maybe
so it stands out more in "git status"?

johannes
