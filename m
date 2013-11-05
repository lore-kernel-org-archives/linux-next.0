From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: Re: randconfig build error with next-20131104, in security/integrity
Date: Tue, 5 Nov 2013 21:12:26 +0900
Message-ID: <201311052112.DCC60296.MFOOFSOHJVtLQF@I-love.SAKURA.ne.jp>
References: <CA+r1Zhir86Mdmps5N1awK7mJxf1CWgkr-RDKYVhmpj_3+oYyYQ@mail.gmail.com>
	<1383606829.15186.25.camel@dhcp-9-2-203-236.watson.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <1383606829.15186.25.camel@dhcp-9-2-203-236.watson.ibm.com>
Sender: linux-security-module-owner@vger.kernel.org
To: zohar@linux.vnet.ibm.com, jim.epost@gmail.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, james.l.morris@oracle.com, linux-security-module@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Mimi Zohar wrote:
> @@ -132,24 +133,22 @@ static inline int integrity_digsig_verify(const unsigned int id,
>  	return -EOPNOTSUPP;
>  }
>  
> +static int integrity_init_keyring(const unsigned int id)

Please add inline keyword, or compiler makes noisy warning.

> +{
> +	return 0;
> +}
>  #endif /* CONFIG_INTEGRITY_SIGNATURE */
