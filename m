From: Joe Perches <joe@perches.com>
Subject: Re: linux-next: Fixes tag needs some work in the clk tree
Date: Fri, 18 Jan 2019 10:36:45 -0800
Message-ID: <537b4ea9870fbb93e26f83e7a06ff2091db39ec5.camel@perches.com>
References: <20190116083440.11b6839c@canb.auug.org.au>
         <154767815973.169631.1738587342757192096@swboyd.mtv.corp.google.com>
         <CAOMZO5DSbVpha=1_s5K+-vodD+N1fGnj41_UKmvqxDOPhxXwfg@mail.gmail.com>
         <154775054438.169631.5111867106558251203@swboyd.mtv.corp.google.com>
         <878szi3zp6.fsf@concordia.ellerman.id.au>
         <154783304655.169631.12906027462791855701@swboyd.mtv.corp.google.com>
         <20190118174127.GA822@flashbox>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190118174127.GA822@flashbox>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Chancellor <natechancellor@gmail.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: linux-next.vger.kernel.org

On Fri, 2019-01-18 at 10:41 -0700, Nathan Chancellor wrote:
> On Fri, Jan 18, 2019 at 09:37:26AM -0800, Stephen Boyd wrote:
> > Do you have a patch for checkpatch too? Maybe Joe can solve my problem.
> Joe posted a checkpatch diff in another thread:
> https://lore.kernel.org/lkml/40bfc40958fca6e2cc9b86101153aa0715fac4f7.camel@perches.com/

That proposal has the negative that a Fixes: line
is often after a Signed-off-by: line and the test
does not validate Fixes lines after Signed-off-by:s.

I would still appreciate some external testing of
the proposed patch.
