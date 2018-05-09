From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: linux-next: build warning after merge of the mac80211-next tree
Date: Wed, 09 May 2018 09:44:12 +0200
Message-ID: <1525851852.6910.1.camel@sipsolutions.net>
References: <20180509145624.643d2e56@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180509145624.643d2e56@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>
List-Id: linux-next.vger.kernel.org

Thanks Stephen,

The 0-day bot also gave me this heads-up, there are a few more places
like it too. I'd asked Toke to fix the ones in the stack, but we both
missed the ones in the drivers. I'll get a fix in for that one way or
the other.

johannes
