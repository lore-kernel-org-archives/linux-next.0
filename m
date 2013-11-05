From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: Re: randconfig build error with next-20131104, in security/integrity
Date: Tue, 05 Nov 2013 07:55:16 -0500
Message-ID: <1383656116.17256.0.camel@dhcp-9-2-203-236.watson.ibm.com>
References: <CA+r1Zhir86Mdmps5N1awK7mJxf1CWgkr-RDKYVhmpj_3+oYyYQ@mail.gmail.com>
	 <1383606829.15186.25.camel@dhcp-9-2-203-236.watson.ibm.com>
	 <201311052112.DCC60296.MFOOFSOHJVtLQF@I-love.SAKURA.ne.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <201311052112.DCC60296.MFOOFSOHJVtLQF@I-love.SAKURA.ne.jp>
Sender: linux-security-module-owner@vger.kernel.org
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: jim.epost@gmail.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, james.l.morris@oracle.com, linux-security-module@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, 2013-11-05 at 21:12 +0900, Tetsuo Handa wrote:
> Mimi Zohar wrote:
> > @@ -132,24 +133,22 @@ static inline int integrity_digsig_verify(const unsigned int id,
> >  	return -EOPNOTSUPP;
> >  }
> >  
> > +static int integrity_init_keyring(const unsigned int id)
> 
> Please add inline keyword, or compiler makes noisy warning.

Thanks!

Mimi

> > +{
> > +	return 0;
> > +}
> >  #endif /* CONFIG_INTEGRITY_SIGNATURE */
> 


