From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Thu, 13 Oct 2011 11:31:28 -0600
Message-ID: <20111013173128.GE18574@ponder.secretlab.ca>
References: <20111006144826.a69a5ea59d4ca94f8f7414cf@canb.auug.org.au>
 <20111011173714.d54bbcee6c0676ddcc37a1f3@canb.auug.org.au>
 <4E93EA10.4030405@dsn.lapis-semi.com>
 <20111012152451.66ce5ddffb4c5b3a4f6a31cf@canb.auug.org.au>
 <4E9525AC.9080909@dsn.lapis-semi.com>
 <CABMQnV+S2WbW0YZBiMXfs81b2dyLzj9wBxPmNuFrYErKfXsWtg@mail.gmail.com>
 <4E9551B8.4060601@dsn.lapis-semi.com>
 <20111013035714.GD15829@ponder.secretlab.ca>
 <4E969FAE.5000909@dsn.lapis-semi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4E969FAE.5000909@dsn.lapis-semi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomoya MORINAGA <tomoya-linux@dsn.lapis-semi.com>
Cc: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Oct 13, 2011 at 05:22:06PM +0900, Tomoya MORINAGA wrote:
> (2011/10/13 12:57), Grant Likely wrote:
> >I've temporarily pushed out a commit that makes the pch and ml_ioh
> >bool instead of tristate.  If that other patch gets acked by Thomas,
> >then I should probably take it through the gpio tree.
> Let me clarify your intention.
> Does previous patch for generic-chip posted by Nobuhiro enable
> pch/ml_ioh gpio driver works on both module and built-in ?
> If yes, why do you need to change tristate to bool ?

Thomas requested changes to that patch.  I cannot pick it up until I
see the new patch and get an ack from Thomas.

g.
