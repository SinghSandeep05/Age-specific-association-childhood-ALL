Childhood Acute lymphoblastic leukemia age-specific association
===============================================================

Introduction
------------

    ggplot(Age_incidence, aes(x = Age, y = Incidence_rate))+
      geom_line(linetype = "dashed", color="blue")+
      geom_point()+
      xlab("Age (year)")+
      ylab("Incidence Rate/1,000,000")+
      theme_classic()

<img src="Childhood_ALL_GWAS_files/figure-markdown_strict/unnamed-chunk-3-1.png" alt="Figure 1: Age-specific incidence rate in childhood ALL"  />
<p class="caption">
Figure 1: Age-specific incidence rate in childhood ALL
</p>
