public aspect TraceAspectCook {
    pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);
    
    //MY ANSWER
    pointcut methodToTrace(): classToTrace() && execution(* *(..));
    
    before(): methodToTrace() {
            String name  = thisJoinPointStaticPart.getSignature() + ", " +  thisJoinPointStaticPart.getSourceLocation().getLine();
            System.out.println("[BGN] " + name);
            }
    
    after(): methodToTrace() {
        System.out.println("[END] "  + thisJoinPointStaticPart.getSourceLocation().getFileName());
        }
}
