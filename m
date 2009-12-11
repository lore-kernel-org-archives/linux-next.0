From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for December 11 (media/dvb/frontends)
Date: Fri, 11 Dec 2009 09:36:37 -0800
Message-ID: <20091211093637.be0b6584.randy.dunlap@oracle.com>
References: <20091211160151.6b71078e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758206AbZLKRhB@vger.kernel.org>
In-Reply-To: <20091211160151.6b71078e.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-media@vger.kernel.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, 11 Dec 2009 16:01:51 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> My usual call for calm: please do not put stuff destined for 2.6.34 into
> linux-next trees until after 2.6.33-rc1.
> 
> Changes since 20091210:


drivers/media/dvb/frontends/dib0090.h:103: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'frontend_tune_state'

static inline num frontend_tune_state dib0090_get_tune_state(struct dvb_frontend *fe)

s/num/enum/

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

drivers/media/dvb/frontends/dib8000.h:104: error: expected expression before '}' token
drivers/media/dvb/frontends/dib8000.h:104: warning: left-hand operand of comma expression has no effect

    return CT_SHUTDOWN,

s/,/;/
and use tab to indent.



someone built/tested these??

---
~Randy
