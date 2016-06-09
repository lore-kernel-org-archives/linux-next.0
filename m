From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings after merge of the kbuild tree
Date: Thu, 9 Jun 2016 14:05:05 +1000
Message-ID: <20160609140505.3e336ba3@canb.auug.org.au>
References: <20160609122258.1c2068f0@canb.auug.org.au>
	<CAGXu5jLxN65Z-+Miiju3VcOK7fpWKqAQY6hn6u5KTZm_NP54kQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGXu5jLxN65Z-+Miiju3VcOK7fpWKqAQY6hn6u5KTZm_NP54kQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: Michal Marek <mmarek@suse.cz>, Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Emese Revfy <re.emese@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Kees,

On Wed, 8 Jun 2016 19:56:38 -0700 Kees Cook <keescook@chromium.org> wrote:
>
> Congratulations on having the gcc plugin development headers
> successfully installed! ;)

Thanks :-)

> Ah, yes, that should default to off. We'll get a fix landed ASAP.

Note that this was an allmodconfig build.  The default is 'n', but
allmodconfig will turn it on (as will allyesconfig).

-- 
Cheers,
Stephen Rothwell
