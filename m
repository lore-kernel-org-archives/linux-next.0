Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016983;
	b=5UFxZaR2Z/IbQCpTyfb2T0xVG+JXt76YrJfAD+27zaeia+3LRMsYGNLHuZqdz0PDZpI8
	 I2gwKrdhq+yMd/Qcn5+Vatr0PwKevXSR3DXUhy7eESKNRN7zlHRFw+eo9+FEzmWhgNZrB
	 +WYpK+kZ4rTnNzSOixQ6fbeq3uWzBdk8adBIk0nCidDbBgxpxiiXxUzUTKyUCIJKN8He7
	 HHv4tvuF2zoVb/Q1g7FqaZksleHBAYXWZBBTS8o5V5oWV29/sZn5ALxkMcB39e3vxRcds
	 ebk5lkoRTe6/PROzhP95qjDDKS4zfbIX+gIfHm8VooG7NYJBnCQ9kK+7BzY4Snv3Xqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016983;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NZG6HsGigDq4eneMKusu+xbdmPLPZkWlT4Jrt7GsbTg=;
	b=opH1yqk0yUIH9b1+lxdRhrvFuo8u4JBsYgzrIOEmzvjIXpQdqrVJlUeUoWwQXUwfy+cn
	 uX7jZXcF0xvVvPYJIZSLB9b0uD5VjzxtH4nWymG6b9FeyZx2YW966vbehWfX3aeo4JGxW
	 +98MVfX8TaAu4ABEfSOpIXF3QzCkAksKRi+Cr368csQV+pArRD557Gwze2QsEBw2T4zrg
	 6hlV+I1r7diELqUUybRYiyffFqQ8TvGGUyVxtw4ttVJDfrFODxPKxP1uzQf9yEZsoxzap
	 JuO3gM+cjSN9+XTuQ3YAts33LaR7PC+VAgfLr+xuaSi3jewoTDV7n6stQzEopb9ZlNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f5Hs3XyW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 4CAAF606A32C;
	Wed, 18 Nov 2026 15:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f5Hs3XyW
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C23791F000C5;
	Wed, 18 Nov 2026 15:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795016983;
	bh=NZG6HsGigDq4eneMKusu+xbdmPLPZkWlT4Jrt7GsbTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f5Hs3XyWP4sp3nJnfj7T6n9A0vcuoxTXBZ51I784RVAdcZpoCFJs9MMMAkANQWYhD
	 xqgVveFqliajVpamVaozwM2seMF+Dh3G4qZaRqFOqNYC8iKCbO9DMFujWMv77r2nSd
	 oRn+wDwgZ1qoR7o8re/3UKdsYACkQWcDSuPcAQ7VFZFce4GYrH0Ol8MYX1NXTIWNU7
	 l9ZPvnHFxwoPdl1fk0xUHIuHv2ABTYnPVrESSrB1pb++OWFMGkWT3RCBmxtxaAFv7c
	 2XoyBk3S+O9cX705mJOKl+uqkOdXkN383cQh5MwK2BZUCD7aRNkdf2bgxalriB82V6
	 I6ePgumQTPC4g==
Date: Wed, 18 Nov 2026 10:49:41 -0500
From: Joel Fernandes <jfern@kernel.org>
To: paulmck@kernel.org
Cc: Mark Brown <broonie@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: Re: linux-next: manual merge of the paulmck tree with the rcu tree
Message-ID: <20261118154941.GB946893@joelbox>
References: <avzYzJYQGafi4gGL@sirena.org.uk>
 <79d23a21-b91f-4709-b956-019288f62f10@paulmck-laptop>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79d23a21-b91f-4709-b956-019288f62f10@paulmck-laptop>

On 11/17, "Paul E. McKenney" <paulmck@kernel.org> wrote:
> On Tue, Nov 17, 2026 at 10:44:28PM +0000, Mark Brown wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the paulmck tree got a conflict in:
> > 
> >   tools/testing/selftests/rcutorture/bin/torture.sh
> > 
> > between commit:
> > 
> >   7ada0a57267ab ("torture: Use ${:+} to save a few lines in torture.sh's torture_one()")
> > 
> > from the rcu tree and commit:
> > 
> >   436f3c6b27de8 ("torture.sh: Add hazptr torturing")
> > 
> > from the paulmck tree.  AFAICT the change in the hazptr commit is adding
> > quoting that is also covered by the other commit and should have been
> > redundant anyway but you really want to double check here.
> 
> I confess, I am confused.  If you said that the commit from the rcu
> tree was instead this one:
> 
> ccabfbe01ca5 ("torture: Avoid duplicate identify_qemu_vcpus calls in torture.sh")
> 
> I would be less confused.

Maybe both patches conflicted? The one Mark posted resolved as follows:

rcu/next tree:
  	"$@" ${torture_bootargs:+--bootargs "$torture_bootargs"} --datestamp "$ds/results-$curflavor" > $T/$curflavor.out 2>&1

Paul's tree:
    "$@" "${boottag}" "$cur_bootargs" --datestamp "$ds/results $curflavor" > $T/$curflavor.out 2>&1

Mark's resolution:
	"$@" ${torture_bootargs:+--bootargs "$torture_bootargs"} --datestamp "$ds/results-$curflavor" > $T/$curflavor.out 2>&1

Both versions look to be doing the same thing, which is adding the boot
arguments if the `torture boot args` variable was defined. 

thanks,

Joel Fernandes



> 
> Either way, your resolution looks good and thank you!
> 
> 							Thanx, Paul
> 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > diff --combined tools/testing/selftests/rcutorture/bin/torture.sh
> > index 1b7ad2c15e1ed,90b5e113a0b03..0000000000000
> > --- a/tools/testing/selftests/rcutorture/bin/torture.sh
> > +++ b/tools/testing/selftests/rcutorture/bin/torture.sh
> > @@@ -43,10 -43,11 +43,11 @@@ f
> >   configs_rcutorture=
> >   configs_locktorture=
> >   configs_scftorture=
> > + configs_hazptr=
> >   kcsan_kmake_args=
> >   
> >   # Default compression, duration, and apportionment.
> >  -compress_concurrency="`identify_qemu_vcpus`"
> >  +compress_concurrency="${TORTURE_ALLOTED_CPUS}"
> >   duration_base=10
> >   duration_rcutorture_frac=7
> >   duration_locktorture_frac=1
> > @@@ -70,6 -71,7 +71,7 @@@ do_rcutasksflavors="${ifnotaarch64}" # 
> >   do_srcu_lockdep=yes
> >   do_atomic_srcu=yes
> >   do_rcu_rust=no
> > + do_hazptr=yes
> >   
> >   # doyesno - Helper function for yes/no arguments
> >   function doyesno () {
> > @@@ -90,6 -92,7 +92,7 @@@ usage () 
> >   	echo "       --do-all"
> >   	echo "       --do-allmodconfig / --do-no-allmodconfig / --no-allmodconfig"
> >   	echo "       --do-clocksourcewd / --do-no-clocksourcewd / --no-clocksourcewd"
> > + 	echo "       --do-hazptr / --do-no-hazptr / --no-hazptr"
> >   	echo "       --do-kasan / --do-no-kasan / --no-kasan"
> >   	echo "       --do-kcsan / --do-no-kcsan / --no-kcsan"
> >   	echo "       --do-kvfree / --do-no-kvfree / --no-kvfree"
> > @@@ -119,6 -122,11 +122,11 @@@ d
> >   		compress_concurrency=$2
> >   		shift
> >   		;;
> > + 	--config-hazptr|--configs-hazptr)
> > + 		checkarg --configs-hazptr "(list of config files)" "$#" "$2" '^[^/]\+$' '^--'
> > + 		configs_hazptr="$configs_hazptr $2"
> > + 		shift
> > + 		;;
> >   	--config-rcutorture|--configs-rcutorture)
> >   		checkarg --configs-rcutorture "(list of config files)" "$#" "$2" '^[^/]\+$' '^--'
> >   		configs_rcutorture="$configs_rcutorture $2"
> > @@@ -149,6 -157,7 +157,7 @@@
> >   		do_kasan=yes
> >   		do_kcsan=yes
> >   		do_clocksourcewd="${ifnotaarch64}"
> > + 		do_hazptr=yes
> >   		do_srcu_lockdep=yes
> >   		do_atomic_srcu=yes
> >   		;;
> > @@@ -158,6 -167,9 +167,9 @@@
> >   	--do-clocksourcewd|--do-no-clocksourcewd|--no-clocksourcewd)
> >   		do_clocksourcewd=`doyesno "$1" --do-clocksourcewd`
> >   		;;
> > + 	--do-hazptr|--do-no-hazptr|--no-hazptr)
> > + 		do_hazptr=`doyesno "$1" --do-hazptr`
> > + 		;;
> >   	--do-kasan|--do-no-kasan|--no-kasan)
> >   		do_kasan=`doyesno "$1" --do-kasan`
> >   		;;
> > @@@ -185,6 -197,7 +197,7 @@@
> >   		do_kasan=no
> >   		do_kcsan=no
> >   		do_clocksourcewd=no
> > + 		do_hazptr=no
> >   		do_srcu_lockdep=no
> >   		do_atomic_srcu=no
> >   		;;
> > @@@ -341,8 -354,16 +354,8 @@@ touch $T/successe
> >   # Note that quoting is problematic.  So on the command line, pass multiple
> >   # values with multiple kvm.sh argument instances.
> >   function torture_one {
> >  -	local cur_bootargs=
> >  -	local boottag=
> >  -
> >   	echo " --- $curflavor:" Start `date` | tee -a $T/log
> >  -	if test -n "$torture_bootargs"
> >  -	then
> >  -		boottag="--bootargs"
> >  -		cur_bootargs="$torture_bootargs"
> >  -	fi
> >  -	"$@" "${boottag}" "$cur_bootargs" --datestamp "$ds/results-$curflavor" > $T/$curflavor.out 2>&1
> >  +	"$@" ${torture_bootargs:+--bootargs "$torture_bootargs"} --datestamp "$ds/results-$curflavor" > $T/$curflavor.out 2>&1
> >   	retcode=$?
> >   	resdir="`grep '^Results directory: ' $T/$curflavor.out | tail -1 | sed -e 's/^Results directory: //'`"
> >   	if test -z "$resdir"
> > @@@ -720,6 -741,17 +733,17 @@@ the
> >   	fi
> >   fi
> >   
> > + # Calculate hazptr defaults and apportion time
> > + if test -z "$configs_hazptr"
> > + then
> > + 	configs_hazptr=CFLIST
> > + fi
> > + if test "$do_hazptr" = "yes"
> > + then
> > + 	torture_bootargs=""
> > + 	torture_set "hazptr" tools/testing/selftests/rcutorture/bin/kvm.sh --torture hazptr --allcpus --duration "$duration_rcutorture" --configs "$configs_hazptr" --trust-make
> > + fi
> > + 
> >   echo " --- " $scriptname $args
> >   echo " --- " Done `date` | tee -a $T/log
> >   ret=0
> 
> 
